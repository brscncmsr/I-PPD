import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_button/group_button.dart';
import 'package:get/get.dart';

class Sleep extends StatefulWidget {
  Sleep({Key? key}) : super(key: key);

  @override
  _SleepState createState() => _SleepState();
}

class _SleepState extends State<Sleep> {
  dynamic argumentData = Get.arguments;

  final TextEditingController _ageController = TextEditingController();

  String _result = "Değer Girin";
  String _rsttext = "";
  String _lbtext = "";
  int select = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Günlük Uyku İhtiyacı',style:GoogleFonts.balooThambi(color:Colors.blue)),
        //centerTitle: true,
        backgroundColor: Colors.blue.shade200,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.all(10.0)),
                SizedBox(height: 20),
                Text("Yaş Grubu",style:TextStyle(fontFamily : 'Roboto',
                       fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                GroupButton(
                  selectedTextStyle: TextStyle(fontFamily : 'Roboto',
                      color: Colors.black87, fontWeight: FontWeight.bold),
                  unselectedTextStyle:
                      TextStyle(fontFamily : 'Roboto',color: Colors.black87),
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
                SizedBox(
                  width: 300,
                  child: TextField(
                    maxLength: 2,
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      counterText: '',
                      helperText: 'Örneğin 40 olarak girebilirsiniz',
                      helperStyle: TextStyle(fontFamily : 'Roboto',
                          fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.035),
                      icon: Container(
                          width: MediaQuery.of(context).size.height * 0.05,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: Image(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/img/age.png'))),
                      labelText: _lbtext,
                      labelStyle: TextStyle(fontFamily : 'Roboto',),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(10.0)),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(
                      color: Colors.blue.shade300,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            width: 3,
                            color: Colors.blue,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Text(
                        "Hesapla",
                        style: GoogleFonts.patrickHand(
                            color: Colors.white60,
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.width * 0.055),
                      ),
                      onPressed: _timeofsleep,
                    ),
                    SizedBox(width: 10),
                    FlatButton(
                      color: Colors.blue.shade300,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            width: 3,
                            color: Colors.blue,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Text(
                        "Temizle",
                        style: GoogleFonts.patrickHand(
                            color: Colors.white60,
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.width * 0.055),
                      ),
                      onPressed: _clear,
                    ),
                    SizedBox(height: 15),
                  ],
                ),
                SizedBox(height: 15),
                Text(
                  _result == null ? "Değeri Gir" : _rsttext,
                  style: TextStyle(fontFamily : 'Roboto',
                    color: Colors.pink.shade900,
                    fontSize: MediaQuery.of(context).size.width * 0.09,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
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

  void _timeof() {
    double _age = double.parse(argumentData.text);
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
