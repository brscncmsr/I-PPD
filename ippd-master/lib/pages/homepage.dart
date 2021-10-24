import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:group_button/group_button.dart';
import 'package:ippd/pages/bmh.dart';
import 'package:ippd/pages/bmi.dart';
import 'package:ippd/pages/nurse.dart';
import 'package:ippd/pages/risk.dart';
import 'package:ippd/pages/sleep.dart';
import 'package:ippd/pages/water.dart';
import 'package:ippd/pharmacy/nobetci.dart';
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

  double bmI = 0.0;
  double? su;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blue.shade200,
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                      child: Nurse(), type: PageTransitionType.bottomToTop));
            },
            child: Image(
                fit: BoxFit.fill,
                //width: 200,
                //height: 200,
                image: AssetImage('assets/img/nurse.png')),
          ),
          body: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 1,
              padding: const EdgeInsets.all(0.0),
            alignment: Alignment.center,
            decoration: new BoxDecoration(
            gradient: new RadialGradient(
              center: Alignment.center,
              radius: 0.75,
              colors: [
                Colors.white60,
                Colors.blue.shade200,
              ],
              stops: [
                0,
                1.0,
              ],
              ),
            ),
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
                                            type: PageTransitionType
                                                .bottomToTop));},

                                  //color:Colors.blue.shade700,
                                  padding: EdgeInsets.all(5),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.06,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.06,
                                          child: Image(
                                              fit: BoxFit.fill,
                                              image: AssetImage(
                                                  'assets/img/bmi.png'))),
                                      Text(
                                        "Beden Kitle\n   Endeksi",
                                        style: GoogleFonts.patrickHand(
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
                                            type: PageTransitionType
                                                .bottomToTop));
                                  },

                                  //color:Colors.blue.shade700,
                                  padding: EdgeInsets.all(5),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.06,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.06,
                                          child: Image(
                                              fit: BoxFit.fill,
                                              image: AssetImage(
                                                  'assets/img/night.png'))),
                                      Text(
                                        "Uyku Sürem",
                                        style: GoogleFonts.patrickHand(
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
                                            child: Risk(),
                                            type: PageTransitionType
                                                .bottomToTop));
                                  },

                                  //color:Colors.blue.shade700,
                                  padding: EdgeInsets.all(5),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.06,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.06,
                                          child: Image(
                                              fit: BoxFit.fill,
                                              image: AssetImage(
                                                  'assets/img/heart-disease.png'))),
                                      Text(
                                        "Hastalık Riskimi\n      Hesapla",
                                        style: GoogleFonts.patrickHand(
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
                                            type: PageTransitionType
                                                .bottomToTop));
                                  },

                                  //color:Colors.blue.shade700,
                                  padding: EdgeInsets.all(5),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.06,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.06,
                                          child: Image(
                                              fit: BoxFit.fill,
                                              image: AssetImage(
                                                  'assets/img/check-up.png'))),
                                      Text(
                                        "       Bazal \n  Metabolizma",
                                        style: GoogleFonts.patrickHand(
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
                                            type: PageTransitionType
                                                .bottomToTop));
                                  },

                                  //color:Colors.blue.shade700,
                                  padding: EdgeInsets.all(5),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.06,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.06,
                                          child: Image(
                                              fit: BoxFit.fill,
                                              image: AssetImage(
                                                  'assets/img/water.png'))),
                                      Text(
                                        "Su İhtiyacım",
                                        style: GoogleFonts.patrickHand(
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
                                      child: NobetciEczane(),
                                    ),
                                  ),
                                  //color:Colors.blue.shade700,
                                  padding: EdgeInsets.all(5),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.06,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.06,
                                          child: Image(
                                              fit: BoxFit.fill,
                                              image: AssetImage(
                                                  'assets/img/drugstore.png'))),
                                      Text(
                                        "    Nöbetçi\n   Eczaneler",
                                        style: GoogleFonts.patrickHand(
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
        ));
  }
}
