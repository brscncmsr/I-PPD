import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:group_button/group_button.dart';
import 'package:ippd/localekeys.dart';
import 'package:ippd/pages/bmh.dart';
import 'package:ippd/pages/bmi.dart';
import 'package:ippd/pages/nurse.dart';
import 'package:ippd/pages/risk.dart';
import 'package:ippd/pages/sleep.dart';
import 'package:ippd/pages/water.dart';
import 'package:ippd/pharmacy/home.dart';

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
  bool a = false;

  @override
  Widget build(BuildContext context) {
    SnackBar snackbar1 = SnackBar(
      content: Text("Çıkmak İçin İki Defa Geri Tuşuna Basın veya Çık'a basın"),
      action: SnackBarAction(
        label: 'Çık',
        onPressed: () {
          SystemNavigator.pop();
        },
      ),
    );
    return WillPopScope(
        onWillPop: () async {
          Scaffold.of(context).showSnackBar(snackbar1);
          return a;
        },
        child: MaterialApp(
          locale: context.locale,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
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
            body: Container(
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
                              width: MediaQuery.of(context).size.width * 0.25,
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
                                                  .width *
                                              0.09,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.06,
                                          child: Image(
                                              fit: BoxFit.fill,
                                              image: AssetImage(
                                                  'assets/img/bmi.png'))),
                                      Text(LocaleKeys.homemass.tr(),
                                          style: TextStyle(
                                              fontFamily: "Times New Roman",
                                              fontWeight: FontWeight.w600,
                                              color: Colors.pink.shade900,
                                              fontSize: MediaQuery.of(context)
                                                      .textScaleFactor *
                                                  12)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(7.5),
                              width: MediaQuery.of(context).size.width * 0.25,
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
                                                  .width *
                                              0.09,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.06,
                                          child: Image(
                                              fit: BoxFit.fill,
                                              image: AssetImage(
                                                  'assets/img/night.png'))),
                                      Text(LocaleKeys.homesleep.tr(),
                                          style: TextStyle(
                                              fontFamily: "Times New Roman",
                                              fontWeight: FontWeight.w600,
                                              color: Colors.pink.shade900,
                                              fontSize: MediaQuery.of(context)
                                                      .textScaleFactor *
                                                  12)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(7.5),
                              width: MediaQuery.of(context).size.width * 0.25,
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
                                                  .width *
                                              0.09,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.06,
                                          child: Image(
                                              fit: BoxFit.fill,
                                              image: AssetImage(
                                                  'assets/img/heart-disease.png'))),
                                      Text(LocaleKeys.homerisk.tr(),
                                          style: TextStyle(
                                              fontFamily: "Times New Roman",
                                              fontWeight: FontWeight.w600,
                                              color: Colors.pink.shade900,
                                              fontSize: MediaQuery.of(context)
                                                      .textScaleFactor *
                                                  12)),
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
                              width: MediaQuery.of(context).size.width * 0.25,
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
                                                  .width *
                                              0.09,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.06,
                                          child: Image(
                                              fit: BoxFit.fill,
                                              image: AssetImage(
                                                  'assets/img/check-up.png'))),
                                      Text(LocaleKeys.homebazal.tr(),
                                          style: TextStyle(
                                              fontFamily: "Times New Roman",
                                              fontWeight: FontWeight.w600,
                                              color: Colors.pink.shade900,
                                              fontSize: MediaQuery.of(context)
                                                      .textScaleFactor *
                                                  11)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(7.5),
                              width: MediaQuery.of(context).size.width * 0.25,
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
                                                  .width *
                                              0.09,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.06,
                                          child: Image(
                                              fit: BoxFit.fill,
                                              image: AssetImage(
                                                  'assets/img/water.png'))),
                                      Text(LocaleKeys.homewater.tr(),
                                          style: TextStyle(
                                              fontFamily: "Times New Roman",
                                              fontWeight: FontWeight.w600,
                                              color: Colors.pink.shade900,
                                              fontSize: MediaQuery.of(context)
                                                      .textScaleFactor *
                                                  12)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(7.5),
                              width: MediaQuery.of(context).size.width * 0.25,
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
                                      child: EczaneApp(),
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
                                                  .width *
                                              0.09,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.06,
                                          child: Image(
                                              fit: BoxFit.fill,
                                              image: AssetImage(
                                                  'assets/img/drugstore.png'))),
                                      Text(LocaleKeys.homepharmacy.tr(),
                                          style: TextStyle(
                                              fontFamily: "Times New Roman",
                                              fontWeight: FontWeight.w600,
                                              color: Colors.pink.shade900,
                                              fontSize: MediaQuery.of(context)
                                                      .textScaleFactor *
                                                  12)),
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
