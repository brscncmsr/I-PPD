import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:group_button/group_button.dart';
import 'package:ippd/location/location.dart';
import 'package:ippd/pages/bmh.dart';
import 'package:ippd/pages/bmi.dart';
import 'package:ippd/pages/sleep.dart';
import 'package:ippd/pages/water.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<Null> refresh() async {
    await Future.delayed(Duration(seconds: 2));
  }

  double _currentSliderValue = 20;

  final TextEditingController _weight = new TextEditingController();
  final TextEditingController _ageController = new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();
  final TextEditingController _heightController = new TextEditingController();

  double _result = 0.0;
  double bmh = 0.0;
  String? _finalResultPrint;
  String? _doneResult;

  void _clear() {
    setState(() {
      _ageController.clear();
      _weightController.clear();
      _heightController.clear();
    });
  }

  void _bmiValue() {
    double age = double.parse(_ageController.text);
    double weight = double.parse(_weightController.text);
    double height = double.parse(_heightController.text) / 100;
    double _result = weight / (height * height);

    _finalResultPrint = "Your Bmi İs ${_result.toStringAsFixed(1)}";

    if ((_ageController.text.isNotEmpty || age > 0) &&
        ((_heightController.text.isNotEmpty || height > 0) &&
            (_weightController.text.isNotEmpty || weight > 0))) {
    } else {
      print("Error");
    }

    if ((double.parse(_result.toStringAsFixed(1)) < 18.5)) {
      _finalResultPrint = "UnderWeight";
      print(_finalResultPrint);
    } else if (double.parse(_result.toStringAsFixed(1)) > 18.5 &&
        (double.parse(_result.toStringAsFixed(1)) <= 25.0)) {
      _finalResultPrint = "Normal";
      print(_finalResultPrint);
    } else if ((double.parse(_result.toStringAsFixed(1)) > 25.0) &&
        (double.parse(_result.toStringAsFixed(1))) < 30.0) {
      _finalResultPrint = "OverWeight";
      print(_finalResultPrint);
    } else if ((double.parse(_result.toStringAsFixed(1))) >= 30.0) {
      _finalResultPrint = "Obesity";
      print(_finalResultPrint);
    }

    setState(() {
      _result;
    });

    _doneResult = "Your BMI is ${_result.toStringAsFixed(1)}";
  }

  void _bmhValue() {
    setState(() {
      double age = double.parse(_ageController.text);
      double weight = double.parse(_weightController.text);
      double height = double.parse(_heightController.text);
      String? gender;
      if (gender == "Kadın") {
        bmh = 655.1 + (9.56 * weight) + (1.85 + height) - (4.68 * age);
      } else {
        bmh = 66.5 + (13.75 * weight) + (5.03 + height) - (6.75 * age);
      }
    });

    _doneResult = "Your BMH is ${_result.toStringAsFixed(1)}";
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue.shade200
          //brightness: Brightness.dark,
          ),
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue.shade200,
          onPressed: () {},
          child: Image(
              fit: BoxFit.fill,
              //width: 200,
              //height: 200,
              image: AssetImage('assets/img/nurse.png')),
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/img/background.png'),
                  repeat: ImageRepeat.repeat,
                  colorFilter:
                      ColorFilter.mode(Colors.white60, BlendMode.color),
                  fit: BoxFit.cover)),
          child: Column(
            children: [
              Image(
                  fit: BoxFit.fill,
                  width: 200,
                  height: 200,
                  image: AssetImage('assets/img/ippd.png')),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.all(7.5),
                          width: MediaQuery.of(context).size.height * 0.15,
                          height: MediaQuery.of(context).size.height * 0.15,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              gradient: RadialGradient(
                                colors: [
                                  Colors.blue.shade100,
                                  Colors.blue.shade200,
                                  Colors.blue.shade300
                                ],
                                center: Alignment(0.6, -0.3),
                                focal: Alignment(0.3, -0.1),
                                focalRadius: 1.0,
                              ),
                            ),
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 3, color: Colors.blue.shade200),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        child: BmI(),
                                        type: PageTransitionType.bottomToTop));
                              },

                              //color:Colors.blue.shade700,
                              padding: EdgeInsets.all(5),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                      width:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      child: Image(
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                              'assets/img/bmi.png'))),
                                  Text(
                                    "Beden Kitle\n   Endeksi",
                                    style: GoogleFonts.amaticSc(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color: Colors.white60),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(7.5),
                          width: MediaQuery.of(context).size.height * 0.15,
                          height: MediaQuery.of(context).size.height * 0.15,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              gradient: RadialGradient(
                                colors: [
                                  Colors.blue.shade100,
                                  Colors.blue.shade200,
                                  Colors.blue.shade300
                                ],
                                center: Alignment(0.6, -0.3),
                                focal: Alignment(0.3, -0.1),
                                focalRadius: 1.0,
                              ),
                            ),
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 3, color: Colors.blue.shade200),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              onPressed: () => Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  duration: Duration(milliseconds: 500),
                                  child: Konum(),
                                ),
                              ),
                              //color:Colors.blue.shade700,
                              padding: EdgeInsets.all(5),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                      width:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      child: Image(
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                              'assets/img/drugstore.png'))),
                                  Text(
                                    "Nöbetçi Eczaneler",
                                    style: GoogleFonts.amaticSc(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color: Colors.white60),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(7.5),
                          width: MediaQuery.of(context).size.height * 0.15,
                          height: MediaQuery.of(context).size.height * 0.15,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              gradient: RadialGradient(
                                colors: [
                                  Colors.blue.shade100,
                                  Colors.blue.shade200,
                                  Colors.blue.shade300
                                ],
                                center: Alignment(0.6, -0.3),
                                focal: Alignment(0.3, -0.1),
                                focalRadius: 1.0,
                              ),
                            ),
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 3, color: Colors.blue.shade200),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              onPressed: () => _dialogalert(context),

                              //color:Colors.blue.shade700,
                              padding: EdgeInsets.all(5),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                      width:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      child: Image(
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                              'assets/img/heart-disease.png'))),
                                  Text(
                                    "Hastalık Riskimi Hesapla",
                                    style: GoogleFonts.amaticSc(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color: Colors.white60),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.all(7.5),
                          width: MediaQuery.of(context).size.height * 0.15,
                          height: MediaQuery.of(context).size.height * 0.15,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              gradient: RadialGradient(
                                colors: [
                                  Colors.blue.shade100,
                                  Colors.blue.shade200,
                                  Colors.blue.shade300
                                ],
                                center: Alignment(0.6, -0.3),
                                focal: Alignment(0.3, -0.1),
                                focalRadius: 1.0,
                              ),
                            ),
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 3, color: Colors.blue.shade200),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        child: BmH(),
                                        type: PageTransitionType.bottomToTop));
                              },

                              //color:Colors.blue.shade700,
                              padding: EdgeInsets.all(5),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                      width:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      child: Image(
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                              'assets/img/check-up.png'))),
                                  Text(
                                    "Bazal Metabolizma",
                                    style: GoogleFonts.amaticSc(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color: Colors.white60),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(7.5),
                          width: MediaQuery.of(context).size.height * 0.15,
                          height: MediaQuery.of(context).size.height * 0.15,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              gradient: RadialGradient(
                                colors: [
                                  Colors.blue.shade100,
                                  Colors.blue.shade200,
                                  Colors.blue.shade300
                                ],
                                center: Alignment(0.6, -0.3),
                                focal: Alignment(0.3, -0.1),
                                focalRadius: 1.0,
                              ),
                            ),
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 3, color: Colors.blue.shade200),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        child: Water(),
                                        type: PageTransitionType.bottomToTop));
                              },

                              //color:Colors.blue.shade700,
                              padding: EdgeInsets.all(5),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                      width:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      child: Image(
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                              'assets/img/water.png'))),
                                  Text(
                                    "Su İhtiyacım",
                                    style: GoogleFonts.amaticSc(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color: Colors.white60),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(7.5),
                          width: MediaQuery.of(context).size.height * 0.15,
                          height: MediaQuery.of(context).size.height * 0.15,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              gradient: RadialGradient(
                                colors: [
                                  Colors.blue.shade100,
                                  Colors.blue.shade200,
                                  Colors.blue.shade300
                                ],
                                center: Alignment(0.6, -0.3),
                                focal: Alignment(0.3, -0.1),
                                focalRadius: 1.0,
                              ),
                            ),
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 3, color: Colors.blue.shade200),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        child: Sleep(),
                                        type: PageTransitionType.bottomToTop));
                              },

                              //color:Colors.blue.shade700,
                              padding: EdgeInsets.all(5),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                      width:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      child: Image(
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                              'assets/img/night.png'))),
                                  Text(
                                    "Uyku Sürem",
                                    style: GoogleFonts.amaticSc(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color: Colors.white60),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
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
      title: "Vucut Kitle Endeksi Hesaplama",
      context: context,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                        children: [
                          TextFormField(
                            //controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: Colors.blue,
                            decoration: InputDecoration(
                              fillColor: Colors.blue,
                              focusColor: Colors.blue,
                              hoverColor: Colors.blue,
                              suffixIcon: Icon(Icons.mail_outlined),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                              //labelStyle: TextStyle(color: Colors.amber),
                              labelText: 'Boy',
                              hintText: 'Boyunuz...',
                              hintStyle: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 3, color: Colors.blue.shade200),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              )),
        ],
      ),
      buttons: [
        DialogButton(
          width: MediaQuery.of(context).size.height * 0.15,
          border: Border.all(width: 3, color: Colors.blue.shade400),
          color: Colors.blue.shade300,
          radius: BorderRadius.all(Radius.circular(15)),
          onPressed: () async {},
          child: Text(
            "Hesapla",
            style: GoogleFonts.patrickHand(
              fontSize: 24,
              color: Colors.white60,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ]).show();
}
