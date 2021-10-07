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
  double _fontsize = 14;
  String _textR = "";
  String _img = "assets/img/MBMI-0.png";
  String _imgn = "assets/img/nurse3.png";
  String sugges1 = "";
  String sugges2 = "";
  String sugges3 = "";
  bool isobes = false;
  bool isrisky = false;
  bool checkbelly = false;
  Color _colortext = Colors.pink.shade900;

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
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        sugges3,
                        style: TextStyle(
                          color: Colors.blue.shade200,
                          fontSize: _fontsize,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Image(image: AssetImage(_imgn))
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
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
                            color: _colortext,
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
                              color: _colortext,
                              fontSize: 15.4,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: Text(
                            sugges2,
                            style: TextStyle(
                              color: _colortext,
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
      isobes = false;
      isrisky = true;
      checkbelly = true;
      _colortext = Colors.green.shade300;
    } else if (result >= 18.5 && result <= 24.9) {
      _textR = "Normal";
      _img = "assets/img/MBMI-2.png";
      isrisky = true;
      checkbelly = true;
      _colortext = Colors.green.shade500;
    } else if (result >= 25 && result <= 29.9) {
      _textR = "Fazla Kilolu";
      _img = "assets/img/MBMI-3.png";
      isrisky = true;
      checkbelly = true;
      _colortext = Colors.orange.shade500;
    } else if (result >= 30 && result <= 34.9) {
      _textR = "Obez";
      _img = "assets/img/MBMI-4.png";
      isobes = true;
      isrisky = false;
      checkbelly = true;
      _colortext = Colors.orange.shade800;
    } else if (result >= 35 && result <= 39.9) {
      _textR = "Ağır Obez";
      _img = "assets/img/MBMI-5.png";
      isobes = true;
      isrisky = false;
      checkbelly = false;
      _colortext = Colors.red.shade600;
    } else if (result >= 40) {
      _textR = "Aşırı Obez";
      _img = "assets/img/MBMI-6.png";
      isobes = true;
      isrisky = false;
      checkbelly = false;
      _colortext = Colors.red.shade900;
    }

    if (isobes) {
      if (result < 18.5) {
        sugges1 =
            "Beslenme durumunuzun değerlendirilmesi için diyetisyene danışınız.";
        sugges2 = "";
      }
      if (result >= 30 && result <= 39.9) {
        _imgn = "assets/img/nurse2.png";
        sugges1 =
            "Beslenme durumunuzun değerlendirilmesi için diyetisyene danışınız.";
        sugges2 =
            "Fiziksel aktivite için uygulamamızda bulunan yaşınıza uygun egzersiz planlarına erişim sağlayabilirsiniz.";
        sugges3 = "İnancını Değil Kilonu Kaybet";
        _fontsize = 14;
      }
      if (result >= 40) {
        _imgn = "assets/img/nurse2.png";
        sugges1 =
            "Beslenme durumunuzun değerlendirilmesi için diyetisyene danışınız.";
        sugges2 =
            "Fiziksel aktivite için uygulamamızda bulunan yaşınıza uygun egzersiz planlarına erişim sağlayabilirsiniz.";
        sugges3 =
            "Endokrinoloji uzmanına danışınız.\nEn yakın sağlık kurumuna gidiniz.";
        _fontsize = 12;
      }
    }
    if (isrisky) {
      sugges3 = "";
      _imgn = "assets/img/nurse3.png";
      if (age >= 19 && age < 30 && select == 0) {
        sugges1 = "Obezite riskiniz yaşınız baz alındığında %41 oranındadır.";
        sugges2 =
            "Daha sağlıklı ve kaliteli bir yaşam için uygulamamızda bulunan yaşınıza uygun egzersiz planlarını kontrol edebilirsiniz.";
      } else if (age >= 19 && age < 30 && select == 1) {
        sugges1 = "Obezite riskiniz yaşınız baz alındığında %20.5 oranındadır.";
        sugges2 =
            "Daha sağlıklı ve kaliteli bir yaşam için uygulamamızda bulunan yaşınıza uygun egzersiz planlarını kontrol edebilirsiniz.";
      } else if (age >= 30 && select == 1) {
        sugges1 =
            "Obezite riskiniz yaşınız baz alındığında %20.5 oranından fazladır.";
        sugges2 =
            "Daha sağlıklı ve kaliteli bir yaşam için uygulamamızda bulunan yaşınıza uygun egzersiz planlarını kontrol edebilirsiniz.";
      } else if (age >= 30 && select == 0) {
        sugges1 =
            "Obezite riskiniz yaşınız baz alındığında %41 oranından fazladır.";
        sugges2 =
            "Daha sağlıklı ve kaliteli bir yaşam için uygulamamızda bulunan yaşınıza uygun egzersiz planlarını kontrol edebilirsiniz.";
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
