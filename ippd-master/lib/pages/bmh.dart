import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_button/group_button.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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
  int active = 0;
  double bmh = 0.0;
  double _bmh = 0.0;
  String _bmhtext = "";
  String bmhtext = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Bazal Metabolizma Hızı'),
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
                SizedBox(
                  height: 10,
                ),
                Text("Aktiflik Seviyesi"),
                SizedBox(
                  height: 10,
                ),
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
                    'Az Aktif',
                    'Hafif Düzeyde Aktif',
                    'Orta Düzeyde Aktif',
                    'Çok Aktif',
                    'Çok Çok Aktif',
                  ],
                  borderRadius: BorderRadius.circular(30),
                  onSelected: (i, selected) => active = i,
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
                    SizedBox(width: 10),
                    RaisedButton(
                      color: Colors.blue.shade200,
                      child: Text(
                        "Temizle",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: _clear,
                    ),
                    SizedBox(width: 10),
                    RaisedButton(
                      color: Colors.blue.shade200,
                      child: Text(
                        "Aktiflik Seviyesi Nedir ?",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () => _dialogalert(context),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Text(
                  bmh == null ? "Değeri Gir" : _bmhtext,
                  style: TextStyle(
                    color: Colors.pink.shade900,
                    fontSize: 19.4,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  bmh == null ? "Değeri Gir" : bmhtext,
                  style: TextStyle(
                    color: Colors.pink.shade900,
                    fontSize: 19.4,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void calculateBMI() {
    double height = double.parse(_heightController.text) / 100;
    double weight = double.parse(_weightController.text);
    double age = double.parse(_ageController.text);

    if (select == 0) {
      _bmh = 655.1 + (9.56 * weight) + (1.85 + height) - (4.68 * age);
      bmh = _bmh;
      if (active == 0) {
        bmh = bmh * 1.2;
      } else if (active == 1) {
        bmh = bmh * 1.3;
      } else if (active == 2) {
        bmh = bmh * 1.5;
      } else if (active == 3) {
        bmh = bmh * 1.7;
      } else if (active == 4) {
        bmh = bmh * 1.9;
      }
      if (bmh >= 1000 && bmh <= 1400) {
        _bmhtext =
            "Bazal Metobolizma Hızınız ${_bmh.toStringAsFixed(2)} Kalori ve Normal";
      } else if (bmh <= 1000) {
        _bmhtext =
            "Bazal Metobolizma Hızınız ${_bmh.toStringAsFixed(2)} Kalori  ve Normalin Altında";
      } else if (bmh >= 1400) {
        _bmhtext =
            "Bazal Metobolizma Hızınız ${_bmh.toStringAsFixed(2)} Kalori ve Normalin Üstünde";
      }
      bmhtext =
          "Günlük almanız gereken enerji ${bmh.toStringAsFixed(2)} kcal/g'dır";
    } else if (select == 1) {
      _bmh = 66.5 + (13.75 * weight) + (5.03 + height) - (6.75 * age);
      bmh = _bmh;
      if (active == 0) {
        bmh = bmh * 1.2;
      } else if (active == 1) {
        bmh = bmh * 1.4;
      } else if (active == 2) {
        bmh = bmh * 1.6;
      } else if (active == 3) {
        bmh = bmh * 1.8;
      } else if (active == 4) {
        bmh = bmh * 2.2;
      }
      if (bmh >= 1200 && bmh <= 1600) {
        _bmhtext =
            "Bazal Metobolizma Hızınız ${_bmh.toStringAsFixed(2)} Kalori ve Normal";
      } else if (bmh <= 1200) {
        _bmhtext =
            "Bazal Metobolizma Hızınız ${_bmh.toStringAsFixed(2)} Kalori ve Normalin Altında";
      } else if (bmh >= 1600) {
        _bmhtext =
            "Bazal Metobolizma Hızınız ${_bmh.toStringAsFixed(2)} Kalori ve Normalin Üstünde";
      }
      bmhtext =
          "Günlük almanız gereken enerji ${bmh.toStringAsFixed(2)} kcal/g'dır";
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

  void onPressed() {}

  _dialogalert(context) {
    Alert(
      onWillPopActive: true,
      closeIcon: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 3, color: Colors.blue),
          ),
          padding: EdgeInsets.all(2),
          child: Icon(Icons.close_outlined, size: 25, color: Colors.blue)),
      style: AlertStyle(
        backgroundColor: Colors.blue.shade200,
        alertElevation: 10,
        alertPadding: EdgeInsets.all(10),
        overlayColor: Colors.blue.shade100,
        animationType: AnimationType.shrink,
        animationDuration: Duration(milliseconds: 600),
        alertBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          side: BorderSide(
            color: Colors.blue.shade300,
            width: 3,
          ),
        ),
      ),
      title: "Aktiflik",
      context: context,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              margin: EdgeInsets.fromLTRB(5, 25, 5, 10),
              width: MediaQuery.of(context).size.height * 0.60,
              height: MediaQuery.of(context).size.height * 0.75,
              child: Card(
                color: Colors.blue.shade100,
                shadowColor: Colors.black,
                child: Padding(
                  //padding:  EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  child: Container(
                    margin: EdgeInsets.fromLTRB(25, 25, 25, 10),
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.all(5),
                            child: Text(
                              "Az Aktif",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            child: Text(
                              "Pek Fazla Hareket Etmiyorsun.Egzersiz yok,masa başında çalışıyorsun,ayrıca çok fazla TV izliyorsun.",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.normal),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            child: Text(
                              "Hafif Düzeyde Aktif",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            child: Text(
                              "Genelde İnsanların Bulunduğu Kısım.Haftada birkaç gün aktifsin 1-3 gün arası egzersiz yapıyorsun",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.normal),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            child: Text(
                              "Orta Düzeyde Aktif",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            child: Text(
                              "Haftada 4-5 gün egzersiz yapıyorsun ve aktif bir yaşam tarzın var",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.normal),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            child: Text(
                              "Çok Aktif",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            child: Text(
                              "Belirli bir amaç ya da spor amacıyla haftada 5-6 saat sıkı çalışıyorsun",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.normal),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            child: Text(
                              "Çok Çok Aktif",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            child: Text(
                              "Dayanaklılık antremanı yapan sporcular ya da haftada 10 ve üstü sıkı antreman yapıyorsun.",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.normal),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )),
        ],
      ),
    ).show();
  }
}
