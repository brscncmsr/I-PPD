import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_button/group_button.dart';

class BmH extends StatefulWidget {
  BmH({Key? key}) : super(key: key);

  @override
  _BmHState createState() => _BmHState();
}

class _BmHState extends State<BmH> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  int select = 0;
  double bmh = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bazal Metabolizma Hızı'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade200,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(10.0)),
            SizedBox(height: 20),
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Boy cm cinsinden',
                icon: Icon(Icons.trending_up),
              ),
            ),
            Padding(padding: EdgeInsets.all(10.0)),
            SizedBox(height: 20),
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Kilo kg cinsinden',
                icon: Icon(Icons.line_weight),
              ),
            ),
            Padding(padding: EdgeInsets.all(10.0)),
            SizedBox(height: 20),
            TextField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Yaşınızı Girin',
                icon: Icon(Icons.line_weight),
              ),
            ),
            Padding(padding: EdgeInsets.all(10.0)),
            SizedBox(height: 20),
            GroupButton(
              selectedTextStyle: GoogleFonts.unkempt(
                  color: Colors.black87, fontWeight: FontWeight.bold),
              unselectedTextStyle: GoogleFonts.unkempt(color: Colors.black87),
              isRadio: true,
              selectedBorderColor: Colors.blue.shade300,
              selectedColor: Colors.blue.shade200,
              unselectedColor: Colors.blue.shade100,
              unselectedBorderColor: Colors.blue,
              spacing: 10,
              buttons: const [
                'Kadın',
                'Erkek',
              ],
              borderRadius: BorderRadius.circular(30),
              onSelected: (i, selected) => select = i,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  color: Colors.blue.shade200,
                  child: Text(
                    "Hesapla",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: calculateBMI,
                ),
                SizedBox(width: 20),
                RaisedButton(
                  color: Colors.blue.shade200,
                  child: Text(
                    "Temizle",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: _clear,
                ),
              ],
            ),
            SizedBox(height: 15),
            Text(
              bmh == null ? "Değeri Gir" : "${bmh.toStringAsFixed(2)} kcal/gün",
              style: TextStyle(
                color: Colors.pink.shade900,
                fontSize: 19.4,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void calculateBMI() {
    double height = double.parse(_heightController.text) / 100;
    double weight = double.parse(_weightController.text);
    double age = double.parse(_ageController.text);

    if (select == 0) {
      bmh = 655.1 + (9.56 * weight) + (1.85 + height) - (4.68 * age);
    } else {
      bmh = 66.5 + (13.75 * weight) + (5.03 + height) - (6.75 * age);
    }
    setState(() {});
  }

  void _clear() {
    setState(() {
      _weightController.clear();
      _heightController.clear();
      _ageController.clear();
    });
  }
}
