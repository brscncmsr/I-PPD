import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_button/group_button.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class BmH extends StatefulWidget {
  BmH({Key? key}) : super(key: key);

  @override
  _BmHState createState() => _BmHState();
}

User? user = FirebaseAuth.instance.currentUser;
dynamic data;

class _BmHState extends State<BmH> {
  /*final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('profile')
      //.orderBy()
      //.where('yas',isGreaterThanOrEqualTo: )
      .snapshots();*/

  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  int select = 0;
  int active = 0;
  double heighta = 0;
  double weighta = 0;
  double agea = 0;
  double bmh = 0.0;
  double _bmh = 0.0;
  String _bmhtext = "";
  String bmhtext = "";
  String? _interest;
  String? _interest1;
  String as = "";
  bool _isSelected = false;
  bool _isSelected1 = false;
  Future<dynamic> getData() async {
    final DocumentReference document =
        FirebaseFirestore.instance.collection("users").doc(user!.uid);

    await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
      setState(() {
        data = snapshot.data();
      });
    });
  }

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
      content: Text("Lütfen Aktiflik Bilginizi Giriniz"),
      action: SnackBarAction(
        label: 'Tamam',
        onPressed: () {},
      ),
    );
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            'Bazal Metabolizma Hızı',
            style: TextStyle(
                fontFamily: "Times New Roman",
                fontWeight: FontWeight.bold,
                color: Colors.pink.shade900,
                fontSize: MediaQuery.of(context).textScaleFactor * 18),
          ),
          //centerTitle: true,
          backgroundColor: Colors.blue.shade200,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.all(10.0)),
                SizedBox(height: 20),
                SizedBox(
                  width: 300,
                  child: TextField(
                    maxLength: 3,
                    controller: _heightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      counterText: '',
                      helperText: 'Örneğin 160 olarak girebilirsiniz',
                      helperStyle: TextStyle(
                          fontFamily: 'Times New Roman',
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width * 0.04),
                      icon: Container(
                          width: MediaQuery.of(context).size.height * 0.05,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: Image(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/img/height.png'))),
                      labelText: 'Boy cm cinsinden',
                      labelStyle: TextStyle(fontFamily: 'Times New Roman'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(10.0)),
                SizedBox(height: 20),
                SizedBox(
                  width: 300,
                  child: TextField(
                    maxLength: 3,
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      counterText: '',
                      helperText: 'Örneğin 80 olarak girebilirsiniz',
                      helperStyle: TextStyle(
                          fontFamily: 'Times New Roman',
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width * 0.04),
                      icon: Container(
                          width: MediaQuery.of(context).size.height * 0.05,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: Image(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/img/weight.png'))),
                      labelText: 'Kilo kg cinsinden',
                      labelStyle: TextStyle(fontFamily: 'Times New Roman'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
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
                      helperStyle: TextStyle(
                          fontFamily: 'Times New Roman',
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width * 0.04),
                      icon: Container(
                          width: MediaQuery.of(context).size.height * 0.05,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: Image(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/img/age.png'))),
                      labelText: 'Yaşınız',
                      labelStyle: TextStyle(fontFamily: 'Times New Roman'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(10.0)),
                SizedBox(height: 20),
                DropdownButton<String>(
                  elevation: 8,
                  style: TextStyle(color: Colors.black87, fontSize: 16),
                  icon: Icon(Icons.arrow_drop_down_circle),
                  iconEnabledColor: Colors.blue,
                  hint: _isSelected
                      ? Text(
                          "$_interest",
                          style: TextStyle(
                              fontFamily: "Times New Roman",
                              fontWeight: FontWeight.bold,
                              color: Colors.pink.shade900,
                              fontSize:
                                  MediaQuery.of(context).textScaleFactor * 18),
                        )
                      : Text(
                          " Cinsiyetiniz ?",
                          style: TextStyle(
                              fontFamily: "Times New Roman",
                              fontWeight: FontWeight.bold,
                              color: Colors.pink.shade900,
                              fontSize:
                                  MediaQuery.of(context).textScaleFactor * 14),
                        ),
                  items: <String>["Kadın", "Erkek"]
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _interest = newValue!;
                      _isSelected = true;
                    });
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Aktiflik Seviyesi",
                      style: TextStyle(
                        fontFamily: 'Times New Roman',
                      ),
                    ),
                    SizedBox(width: 10),
                    IconButton(
                        onPressed: () => _dialogalert(context),
                        icon: Icon(Icons.info))
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                DropdownButton<String>(
                  elevation: 8,
                  style: TextStyle(color: Colors.black87, fontSize: 16),
                  icon: Icon(Icons.arrow_drop_down_circle),
                  iconEnabledColor: Colors.blue,
                  hint: _isSelected1
                      ? Text(
                          "$_interest1",
                          style: TextStyle(
                              fontFamily: "Times New Roman",
                              fontWeight: FontWeight.bold,
                              color: Colors.pink.shade900,
                              fontSize:
                                  MediaQuery.of(context).textScaleFactor * 18),
                        )
                      : Text(
                          " Aktiflik Seviyesi ?",
                          style: TextStyle(
                              fontFamily: "Times New Roman",
                              fontWeight: FontWeight.bold,
                              color: Colors.pink.shade900,
                              fontSize:
                                  MediaQuery.of(context).textScaleFactor * 14),
                        ),
                  items: <String>[
                    'Az Aktif',
                    'Hafif Düzeyde Aktif',
                    'Orta Düzeyde Aktif',
                    'Çok Aktif',
                    'Çok Çok Aktif',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _interest1 = newValue!;
                      _isSelected1 = true;
                    });
                  },
                ),
                FlatButton(
                  color: Colors.blue.shade300,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        width: 3, color: Colors.blue, style: BorderStyle.solid),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Text(
                    "Bilgileri Getir",
                    style: TextStyle(
                        fontFamily: "Times New Roman",
                        fontWeight: FontWeight.bold,
                        color: Colors.pink.shade900,
                        fontSize: MediaQuery.of(context).textScaleFactor * 14),
                  ),
                  onPressed: () => {
                    if (_isSelected1 == false)
                      {ScaffoldMessenger.of(context).showSnackBar(snackbar2)}
                    else
                      {calculateBMIfP()}
                  },
                ),
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
                        if (_ageController.text == "" ||
                            _heightController.text == "" ||
                            _weightController.text == "" ||
                            as == "")
                          {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackbar1)
                          }
                        else
                          {calculateBMI()}
                      },
                    ),
                    SizedBox(width: 20),
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
                    SizedBox(width: 10),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  bmh == null ? "Değeri Gir" : _bmhtext,
                  style: TextStyle(
                    fontFamily: 'Times New Roman',
                    color: Colors.pink.shade900,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  bmh == null ? "Değeri Gir" : bmhtext,
                  style: TextStyle(
                    fontFamily: 'Times New Roman',
                    color: Colors.pink.shade900,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void calculateBMIfP() {
    double height = double.parse(data["boy"]) / 100;
    double weight = double.parse(data["kilo"]);
    double age = double.parse(data["yas"]);
    String gender = data["cinsiyet"];
    showResult(height, weight, age, gender);
  }

  void calculateBMI() {
    double height = double.parse(_heightController.text) / 100;
    double weight = double.parse(_weightController.text);
    double age = double.parse(_ageController.text);
    String gender = _interest.toString();
    showResult(height, weight, age, gender);
  }

  void showResult(double height, double weight, double age, String gender) {
    if (gender == "Kadın") {
      _bmh = 655.1 + (9.56 * weight) + (1.85 + height) - (4.68 * age);
      bmh = _bmh;
      if (_interest1 == "Az Aktif") {
        bmh = bmh * 1.2;
      } else if (_interest1 == 'Hafif Düzeyde Aktif') {
        bmh = bmh * 1.3;
      } else if (_interest1 == 'Orta Düzeyde Aktif') {
        bmh = bmh * 1.5;
      } else if (_interest1 == 'Çok Aktif') {
        bmh = bmh * 1.7;
      } else if (_interest1 == 'Çok Çok Aktif') {
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
    } else if (gender == "Erkek") {
      _bmh = 66.5 + (13.75 * weight) + (5.03 + height) - (6.75 * age);
      bmh = _bmh;
      if (_interest1 == "Az Aktif") {
        bmh = bmh * 1.2;
      } else if (_interest1 == 'Hafif Düzeyde Aktif') {
        bmh = bmh * 1.4;
      } else if (_interest1 == 'Orta Düzeyde Aktif') {
        bmh = bmh * 1.6;
      } else if (_interest1 == 'Çok Aktif') {
        bmh = bmh * 1.8;
      } else if (_interest1 == 'Çok Çok Aktif') {
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
            border: Border.all(width: 3, color: Colors.red),
          ),
          padding: EdgeInsets.all(2),
          child: Icon(Icons.close_outlined, size: 25, color: Colors.red)),
      style: AlertStyle(
        isButtonVisible: false,
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
              width: MediaQuery.of(context).size.height * 0.6,
              height: MediaQuery.of(context).size.height * 0.9,
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
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                  fontWeight: FontWeight.bold),
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
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                  fontWeight: FontWeight.bold),
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
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                  fontWeight: FontWeight.bold),
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
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                  fontWeight: FontWeight.bold),
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
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                  fontWeight: FontWeight.bold),
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
