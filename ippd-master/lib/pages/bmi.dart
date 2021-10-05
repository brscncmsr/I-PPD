import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_button/group_button.dart';
import 'package:ippd/pages/exercise.dart';
import 'package:ippd/pages/func.dart';

class BmI extends StatefulWidget {
  BmI({Key? key}) : super(key: key);

  @override
  _BmIState createState() => _BmIState();
}

class _BmIState extends State<BmI> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _bellyController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  double _result = 0.0;
  int select = 0;
  String _textR = "";
  String _img = "assets/img/MBMI-0.png";
  String sugges1 = "";
  String sugges2 = "";
  bool isobes = false;
  bool isrisky = false;
  bool checkbelly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Vücut Kitle Endeksi'),
          centerTitle: true,
          backgroundColor: Colors.blue.shade200,
        ),
        body: SingleChildScrollView(
          child: Container(
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
                  controller: _bellyController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Bel Çevresi',
                    icon: Icon(Icons.line_weight),
                  ),
                ),
                Padding(padding: EdgeInsets.all(10.0)),
                SizedBox(height: 20),
                TextField(
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Yaşınız',
                    icon: Icon(Icons.line_weight),
                  ),
                ),
                Padding(padding: EdgeInsets.all(10.0)),
                SizedBox(height: 20),
                GroupButton(
                  selectedTextStyle: GoogleFonts.amaticSc(
                      color: Colors.black87, fontWeight: FontWeight.bold),
                  unselectedTextStyle:
                      GoogleFonts.amaticSc(color: Colors.black87),
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
                        onPressed: () {
                          calculateBMI();
                        }),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Image(image: AssetImage(_img)),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Text(
                          _result == null ? "Değeri Gir" : _textR,
                          style: TextStyle(
                            color: Colors.pink.shade900,
                            fontSize: 19.4,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: Text(
                            sugges1,
                            style: TextStyle(
                              color: Colors.pink.shade900,
                              fontSize: 15.4,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: Text(
                            sugges2,
                            style: TextStyle(
                              color: Colors.pink.shade900,
                              fontSize: 15.4,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }

  void calculateBMI() {
    double height = double.parse(_heightController.text) / 100;
    double weight = double.parse(_weightController.text);
    double belly = double.parse(_bellyController.text);
    double age = double.parse(_ageController.text);

    double heightSquare = height * height;
    double result = weight / heightSquare;

    _result = result;
    if (result < 18.5) {
      _textR = "Zayıf";
      _img = "assets/img/MBMI-1.png";
      isobes = true;
      isrisky = false;
      checkbelly = true;
    } else if (result >= 18.5 && result <= 24.9) {
      _textR = "Normal";
      _img = "assets/img/MBMI-2.png";
      isrisky = true;
      checkbelly = true;
    } else if (result >= 25 && result <= 29.9) {
      _textR = "Fazla Kilolu";
      _img = "assets/img/MBMI-3.png";
      isrisky = true;
      checkbelly = true;
    } else if (result >= 30 && result <= 34.9) {
      _textR = "Obez";
      _img = "assets/img/MBMI-4.png";
      isobes = true;
      isrisky = false;
      checkbelly = true;
    } else if (result >= 35 && result <= 39.9) {
      _textR = "Ağır Obez";
      _img = "assets/img/MBMI-5.png";
      isobes = true;
      isrisky = false;
      checkbelly = false;
    } else if (result >= 40) {
      _textR = "Aşırı Obez";
      _img = "assets/img/MBMI-6.png";
      isobes = true;
      isrisky = false;
      checkbelly = false;
    }

    if (isobes) {
      if (result < 18.5) {
        sugges1 =
            "Beslenme durumunuzun değerlendirilmesi için diyetisyene danışınız.";
        sugges2 = "";
      }
      if (result >= 30) {
        sugges1 =
            "Beslenme durumunuzun değerlendirilmesi için diyetisyene danışınız.";
        sugges2 =
            "Fiziksel aktivite için uygulamamızda bulunan yaşınıza uygun egzersiz planlarına erişim sağlayabilirsiniz.";
      }
    }
    if (isrisky) {
      if (age >= 19 && age < 30 && select == 0) {
        sugges1 = "Obezite riskiniz %41 oranındadır.";
        sugges2 = "Beslenmenize ve Hayat Tarzınıza dikkat ediniz.";
      } else if (age >= 19 && age < 30 && select == 1) {
        sugges1 = "Obezite riskiniz %20.5 oranındadır.";
        sugges2 = "Beslenmenize ve Hayat Tarzınıza dikkat ediniz.";
      } else if (age >= 30 && select == 1) {
        sugges1 = "Obezite riskiniz %20.5 oranından fazladır.";
        sugges2 = "Beslenmenize ve Hayat Tarzınıza dikkat ediniz.";
      } else if (age >= 30 && select == 0) {
        sugges1 = "Obezite riskiniz %41 oranından fazladır.";
        sugges2 = "Beslenmenize ve Hayat Tarzınıza dikkat ediniz.";
      }
    }
    if (checkbelly) {
      if (belly > 100 && select == 1) {
        sugges1 =
            "Beslenme durumunuzun değerlendirilmesi için diyetisyene danışınız.";
        sugges2 =
            "Fiziksel aktivite için uygulamamızda bulunan yaşınıza uygun egzersiz planlarına erişim sağlayabilirsiniz.";
      } else if (age > 90 && select == 0) {
        sugges1 =
            "Beslenme durumunuzun değerlendirilmesi için diyetisyene danışınız.";
        sugges2 =
            "Fiziksel aktivite için uygulamamızda bulunan yaşınıza uygun egzersiz planlarına erişim sağlayabilirsiniz.";
      }
    }
    setState(() {});
  }

  void _clear() {
    setState(() {
      _weightController.clear();
      _heightController.clear();
    });
  }
}
