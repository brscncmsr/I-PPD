import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Bmip extends StatefulWidget {
  Bmip({Key? key}) : super(key: key);

  @override
  _BmipState createState() => _BmipState();
}

User? user = FirebaseAuth.instance.currentUser;

class _BmipState extends State<Bmip> {
  Future<Null> refresh() async {
    await Future.delayed(Duration(seconds: 2), () => takeInfo());
  }

  final db = FirebaseFirestore.instance;
  bool _isInitialValue = true;
  String sugges1 = "";
  String _textR = "";
  String sugges2 = "";
  String sugges3 = "";
  String _img = "assets/img/MBMI-0.png";
  String _imgn = "assets/img/nurse3.png";
  double _fontsize = 14;
  double _result = 0.0;
  int select = 0;
  bool isobes = false;
  bool isrisky = false;
  bool checkbelly = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      FlatButton(
        color: Colors.blue.shade300,
        shape: RoundedRectangleBorder(
          side: BorderSide(
              width: 3, color: Colors.blue, style: BorderStyle.solid),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Text(
          "Hesapla",
          style: GoogleFonts.patrickHand(
              color: Colors.white60, fontWeight: FontWeight.bold, fontSize: 21),
        ),
        onPressed: takeInfo,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            child: Text(
              sugges3,
              style: GoogleFonts.patrickHand(
                color: Colors.blue.shade200,
                fontSize: _fontsize,
                fontWeight: FontWeight.bold,
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
                style: GoogleFonts.patrickHand(
                  color: Colors.pink.shade900,
                  fontSize: 19.4,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                width: _isInitialValue
                    ? MediaQuery.of(context).size.width * 0.3
                    : MediaQuery.of(context).size.width * 0.3,
                height: _isInitialValue
                    ? MediaQuery.of(context).size.width * 0.3
                    : MediaQuery.of(context).size.width * 0.4,
                child: Text(
                  sugges1,
                  style: GoogleFonts.patrickHand(
                    color: Colors.pink.shade900,
                    fontSize: 15.4,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.2,
                child: Text(
                  sugges2,
                  style: GoogleFonts.patrickHand(
                    color: Colors.pink.shade900,
                    fontSize: 15.4,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          )
        ],
      )
    ]));
  }

  void showViev(double result, double age, double belly) {
    if (result < 18.5) {
      _textR = "Zayıf";
      _img = "assets/img/MBMI-1.png";
      isobes = false;
      isrisky = true;
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
        sugges1 =
            "Obezite riskiniz cinsiyetiniz ve yaşınız baz alındığında %41 oranındadır.";
        sugges2 =
            "Daha sağlıklı ve kaliteli bir yaşam için uygulamamızda bulunan yaşınıza uygun egzersiz planlarını kontrol edebilirsiniz.";
      } else if (age >= 19 && age < 30 && select == 1) {
        sugges1 =
            "Obezite riskiniz cinsiyetiniz ve yaşınız baz alındığında %20.5 oranındadır.";
        sugges2 =
            "Daha sağlıklı ve kaliteli bir yaşam için uygulamamızda bulunan yaşınıza uygun egzersiz planlarını kontrol edebilirsiniz.";
      } else if (age >= 30 && select == 1) {
        sugges1 =
            "Obezite riskiniz cinsiyetiniz ve yaşınız baz alındığında %20.5 oranından fazladır.";
        sugges2 =
            "Daha sağlıklı ve kaliteli bir yaşam için uygulamamızda bulunan yaşınıza uygun egzersiz planlarını kontrol edebilirsiniz.";
      } else if (age >= 30 && select == 0) {
        sugges1 =
            "Obezite riskiniz cinsiyetiniz ve yaşınız baz alındığında %41 oranından fazladır.";
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

  void takeInfo() async {
    var w, h, a;
    FutureBuilder<DocumentSnapshot>(
        future:
            FirebaseFirestore.instance.collection('users').doc(user!.uid).get(),
        builder: (context, snapshot) {
          w = double.parse(snapshot.requireData["kilo"]);
          return w;
        });
    w = StreamBuilder<DocumentSnapshot>(
        stream: db.collection("users").doc(user!.uid).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          return snapshot.data!["kilo"];
        });
    h = StreamBuilder<DocumentSnapshot>(
        stream: db.collection("users").doc(user!.uid).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          return snapshot.data!["boy"];
        });
    a = StreamBuilder<DocumentSnapshot>(
        stream: db.collection("users").doc(user!.uid).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          return snapshot.data!["yas"];
        });

    double height = double.parse(h) / 100;
    double weight = double.parse(w);
    double belly = 1;
    double age = double.parse(a);

    double heightSquare = height * height;
    double result = weight / heightSquare;
    _result = result;
    showViev(result, age, belly);
    setState(() {});
  }
}
