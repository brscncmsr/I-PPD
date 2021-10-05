import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_button/group_button.dart';

class Sleep extends StatefulWidget {
  Sleep({Key? key}) : super(key: key);

  @override
  _SleepState createState() => _SleepState();
}

class _SleepState extends State<Sleep> {
  final TextEditingController _ageController = TextEditingController();

  String _result = "Değer Girin";
  String _rsttext = "";
  String _lbtext = "";
  int select = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Günlük Uyku İhtiyacı'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade200,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(10.0)),
            SizedBox(height: 20),
            Text("Yaş Grubu"),
            SizedBox(height: 20),
            GroupButton(
              selectedTextStyle: GoogleFonts.amaticSc(
                  color: Colors.black87, fontWeight: FontWeight.bold),
              unselectedTextStyle: GoogleFonts.amaticSc(color: Colors.black87),
              isRadio: true,
              selectedBorderColor: Colors.blue.shade300,
              selectedColor: Colors.blue.shade200,
              unselectedColor: Colors.blue.shade100,
              unselectedBorderColor: Colors.blue,
              spacing: 10,
              buttons: const [
                'Bebek',
                'Çocuk',
                'Genç Birey',
                'Yetişkin',
                'Yaşlı',
              ],
              borderRadius: BorderRadius.circular(30),
              onSelected: (i, selected) => _text(i),
            ),
            Padding(padding: EdgeInsets.all(10.0)),
            SizedBox(height: 20),
            TextField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: _lbtext,
                icon: Icon(Icons.line_weight),
              ),
            ),
            Padding(padding: EdgeInsets.all(10.0)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  color: Colors.blue.shade200,
                  child: Text(
                    "Hesapla",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: _timeofsleep,
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
              _result == null ? "Değeri Gir" : _rsttext,
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

  void _clear() {
    setState(() {
      _ageController.clear();
    });
  }

  void _text(int i) {
    select = i;

    if (select == 0) {
      _lbtext = "Kaç Aylık";
    } else {
      _lbtext = "Kaç Yaşındasınız ?";
    }

    setState(() {});
  }

  void _timeofsleep() {
    double _age = double.parse(_ageController.text);
    double age = _age;
    if (select == 0) {
      if (age >= 0 && age <= 3) {
        _rsttext = "Önerilen Uyku Süresi 14-17 saat.";
      } else if (age >= 4 && age <= 11) {
        _rsttext = "Önerilen Uyku Süresi 12-15 saat.";
      }
    } else {
      if (age >= 1 && age <= 2) {
        _rsttext = "Önerilen Uyku Süresi 11-14 saat.";
      } else if (age >= 3 && age <= 5) {
        _rsttext = "Önerilen Uyku Süresi 10-13 saat.";
      } else if (age >= 6 && age <= 13) {
        _rsttext = "Önerilen Uyku Süresi 9-11 saat.";
      } else if (age >= 14 && age <= 17) {
        _rsttext = "Önerilen Uyku Süresi 8-10 saat.";
      } else if (age >= 18 && age <= 64) {
        _rsttext = "Önerilen Uyku Süresi 7-9 saat.";
      } else if (64 <= age) {
        _rsttext = "Önerilen Uyku Süresi 7-8 saat.";
      }
    }
    setState(() {});
  }
}
