import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:ippd/pages/profil.dart';

class Water extends StatefulWidget {
  Water({Key? key});

  @override
  _WaterState createState() => _WaterState();
}

User? user = FirebaseAuth.instance.currentUser;
dynamic data;

class _WaterState extends State<Water> {
  @override
  final TextEditingController _weightController = TextEditingController();
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

  double weight = 0.0;
  double _result = 0.0;
  double bardak = 0.0;
  var x = 0;
  @override
  Widget build(BuildContext context) {
    final snackbar1 = SnackBar(
      content: Text("Lütfen Bütün Bilgileri Eksiksiz Giriniz"),
      action: SnackBarAction(
        label: 'Tamam',
        onPressed: () {},
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Günlük Su İhtiyacı',
          style: TextStyle(
              fontFamily: "Times New Roman",
              fontWeight: FontWeight.bold,
              color: Colors.pink.shade900,
              fontSize: MediaQuery.of(context).textScaleFactor * 18),
        ),
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
                        fontSize: MediaQuery.of(context).size.width * 0.035),
                    icon: Container(
                        width: MediaQuery.of(context).size.height * 0.05,
                        height: MediaQuery.of(context).size.height * 0.05,
                        child: Image(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/img/weight.png'))),
                    labelText: 'Kilo kg cinsinden',
                    labelStyle: TextStyle(
                        fontFamily: 'Times New Roman',
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                    border: OutlineInputBorder(
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
                      width: 3, color: Colors.blue, style: BorderStyle.solid),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Text(
                  "Profilden",
                  style: TextStyle(
                      fontFamily: "Times New Roman",
                      fontWeight: FontWeight.bold,
                      color: Colors.pink.shade900,
                      fontSize: MediaQuery.of(context).textScaleFactor * 18),
                ),
                onPressed: () {
                  weight = 0;
                  weight = double.parse(data["kilo"]!);
                  waterP(weight);
                },
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                        "Hesapla",
                        style: TextStyle(
                            fontFamily: "Times New Roman",
                            fontWeight: FontWeight.bold,
                            color: Colors.pink.shade900,
                            fontSize:
                                MediaQuery.of(context).textScaleFactor * 18),
                      ),
                      onPressed: () {
                        if (_weightController.text == "") {
                          ScaffoldMessenger.of(context).showSnackBar(snackbar1);
                        } else {
                          waterN();
                        }
                      }),
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
                              MediaQuery.of(context).textScaleFactor * 18),
                    ),
                    onPressed: _clear,
                  ),
                ],
              ),
              SizedBox(height: 15),
              Text(
                _result == null
                    ? "Değeri Gir"
                    : "Günde ortalama ${_result.toStringAsFixed(1)} litre su içmelisiniz.",
                style: TextStyle(
                  fontFamily: 'Times New Roman',
                  color: Colors.pink.shade900,
                  fontSize: MediaQuery.of(context).textScaleFactor * 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15),
              Text(
                _result == null
                    ? "Değeri Gir"
                    : "ve bu günde ${bardak.ceil()} bardak suya eşdeğerdir.",
                style: TextStyle(
                  fontFamily: 'Times New Roman',
                  color: Colors.pink.shade900,
                  fontSize: MediaQuery.of(context).textScaleFactor * 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                children: [
                  Row(
                    children: <Widget>[
                      for (int i = 0; i < bardak; i++)
                        i < 8
                            ? Container(
                                width:
                                    MediaQuery.of(context).size.height * 0.06,
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                child: Image(
                                    fit: BoxFit.cover,
                                    image: AssetImage('assets/img/water.png')),
                              )
                            : Container()
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      for (int i = 8; i < bardak; i++)
                        i < 16
                            ? Container(
                                width:
                                    MediaQuery.of(context).size.height * 0.06,
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                child: Image(
                                    fit: BoxFit.cover,
                                    image: AssetImage('assets/img/water.png')),
                              )
                            : Container()
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      for (int i = 16; i < bardak; i++)
                        i < 24
                            ? Container(
                                width:
                                    MediaQuery.of(context).size.height * 0.06,
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                child: Image(
                                    fit: BoxFit.cover,
                                    image: AssetImage('assets/img/water.png')),
                              )
                            : Container()
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void waterN() {
    weight = double.parse(_weightController.text);
    double result = weight * 0.03;
    result.toStringAsFixed(1);
    _result = result;
    bardak = result / 0.2;
    setState(() {});
  }

  void waterP(double weight) {
    double result = weight * 0.03;
    result.toStringAsFixed(1);
    _result = result;
    bardak = result / 0.2;
    setState(() {});
  }

  void _clear() {
    setState(() {
      _weightController.clear();
    });
  }
}
