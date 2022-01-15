import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_button/group_button.dart';
import 'package:get/get.dart';

class Sleep extends StatefulWidget {
  Sleep({Key? key}) : super(key: key);

  @override
  _SleepState createState() => _SleepState();
}

User? user = FirebaseAuth.instance.currentUser;
dynamic data;

class _SleepState extends State<Sleep> {
  Future<dynamic> getData() async {
    final DocumentReference document =
        FirebaseFirestore.instance.collection("users").doc(user!.uid);

    await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
      setState(() {
        data = snapshot.data();
      });
    });
  }

  dynamic argumentData = Get.arguments;

  final TextEditingController _ageController = TextEditingController();
  String selected1 = "";
  String _result = "Değer Girin";
  String _rsttext = "";
  String _lbtext = "";
  int select = 0;
  bool a = false;
  void initState() {
    super.initState();
    getData();

    // Or call your function here
  }

  @override
  Widget build(BuildContext context) {
    final snackbar1 = SnackBar(
      content: Text("Lütfen Bütün Bilgileri Eksiksiz Giriniz"),
      action: SnackBarAction(
        label: 'Tamam',
        onPressed: () {},
      ),
    );
    final snackbar2 = SnackBar(
      content: Text("Lütfen Yaş Grubu Seçiniz"),
      action: SnackBarAction(
        label: 'Tamam',
        onPressed: () {},
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Günlük Uyku İhtiyacı',
          style: TextStyle(
              fontFamily: "Times New Roman",
              fontWeight: FontWeight.bold,
              color: Colors.pink.shade900,
              fontSize: MediaQuery.of(context).textScaleFactor * 18),
        ),
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
                Text("Yaş Grubu",
                    style: TextStyle(
                        fontFamily: 'Times New Roman',
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                GroupButton(
                  selectedTextStyle: TextStyle(
                      fontFamily: 'Times New Roman',
                      color: Colors.black87,
                      fontWeight: FontWeight.bold),
                  unselectedTextStyle: TextStyle(
                      fontFamily: 'Times New Roman', color: Colors.black87),
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
                  onSelected: (i, selected) => {
                    selected1 = i.toString(),
                    if (selected1 == "0") {a = true} else {a = false},
                    _text(i),
                  },
                ),
                Padding(padding: EdgeInsets.all(10.0)),
                SizedBox(height: 20),
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      counterText: '',
                      helperText: a
                          ? 'Örneğin 10 ay olarak girebilirsiniz'
                          : "Örneğin 40 olarak girebilirsiniz",
                      helperStyle: TextStyle(
                          fontFamily: 'Times New Roman',
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width * 0.035),
                      icon: Container(
                          width: MediaQuery.of(context).size.height * 0.05,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: Image(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/img/age.png'))),
                      labelText: _lbtext,
                      labelStyle: TextStyle(
                        fontFamily: 'Times New Roman',
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color:
                              a ? Colors.pink.shade900 : Colors.blue.shade300,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color:
                              a ? Colors.pink.shade900 : Colors.blue.shade300,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(10.0)),
                SizedBox(height: 20),
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
                      "Profilden",
                      style: TextStyle(
                          fontFamily: "Times New Roman",
                          fontWeight: FontWeight.bold,
                          color: Colors.pink.shade900,
                          fontSize:
                              MediaQuery.of(context).textScaleFactor * 14),
                    ),
                    onPressed: () => {
                          if (selected1 == "")
                            {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackbar2)
                            }
                          else
                            {_timeofsleepP()}
                        }),
                SizedBox(width: 10),
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
                          style: TextStyle(
                              fontFamily: "Times New Roman",
                              fontWeight: FontWeight.bold,
                              color: Colors.pink.shade900,
                              fontSize:
                                  MediaQuery.of(context).textScaleFactor * 14),
                        ),
                        onPressed: () => {
                              if (_ageController.text == "")
                                {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackbar1)
                                }
                              else
                                {_timeofsleep()}
                            }),
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
                        style: TextStyle(
                            fontFamily: "Times New Roman",
                            fontWeight: FontWeight.bold,
                            color: Colors.pink.shade900,
                            fontSize:
                                MediaQuery.of(context).textScaleFactor * 14),
                      ),
                      onPressed: _clear,
                    ),
                    SizedBox(height: 15),
                  ],
                ),
                SizedBox(height: 15),
                Text(
                  _result == null ? "Değeri Gir" : _rsttext,
                  style: TextStyle(
                    fontFamily: 'Times New Roman',
                    color: Colors.pink.shade900,
                    fontSize: 18,
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

  void _timeofsleep() {
    double _age = double.parse(_ageController.text);
    double age = _age;
    showResult(age);
  }

  void _timeofsleepP() {
    double _age = double.parse(data["yas"]);
    double age = _age;
    showResult(age);
  }

  void showResult(double age) {
    if (select == 0) {
      if (age >= 0 && age <= 3) {
        _rsttext = "Önerilen Uyku Süresi 14-17 Saat.";
      } else if (age >= 4 && age <= 11) {
        _rsttext = "Önerilen Uyku Süresi 12-15 Saat.";
      }
    } else {
      if (age >= 1 && age <= 2) {
        _rsttext = "Önerilen Uyku Süresi 11-14 Saat.";
      } else if (age >= 3 && age <= 5) {
        _rsttext = "Önerilen Uyku Süresi 10-13 Saat.";
      } else if (age >= 6 && age <= 13) {
        _rsttext = "Önerilen Uyku Süresi 9-11 Saat.";
      } else if (age >= 14 && age <= 17) {
        _rsttext = "Önerilen Uyku Süresi 8-10 Saat.";
      } else if (age >= 18 && age <= 64) {
        _rsttext = "Önerilen Uyku Süresi 7-9 Saat.";
      } else if (64 <= age) {
        _rsttext = "Önerilen Uyku Süresi 7-8 Saat.";
      }
    }
    setState(() {});
  }
}
