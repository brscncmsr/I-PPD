import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
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
                                              'assets/img/bmi.png'))),
                                  Text(
                                    "Beden Kitle\n   Endeksi",
                                    style: GoogleFonts.amaticSc(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color: Colors.pink.shade900),
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
                                Alert(
                                    onWillPopActive: true,
                                    closeIcon: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              width: 3, color: Colors.red),
                                        ),
                                        padding: EdgeInsets.all(2),
                                        child: Icon(Icons.close_outlined,
                                            size: 25, color: Colors.red)),
                                    style: AlertStyle(
                                      backgroundColor: Colors.blue.shade200,
                                      alertElevation: 10,
                                      alertPadding: EdgeInsets.all(10),
                                      overlayColor: Colors.blue.shade100,
                                      animationType: AnimationType.shrink,
                                      animationDuration:
                                          Duration(milliseconds: 600),
                                      alertBorder: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(25)),
                                        side: BorderSide(
                                          color: Colors.blue.shade300,
                                          width: 3,
                                        ),
                                      ),
                                    ),
                                    title: "Vucut Kitle Endeksi Hesaplama",
                                    context: context,
                                    content: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                            margin: EdgeInsets.fromLTRB(
                                                5, 25, 5, 10),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.60,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.75,
                                            child: Card(
                                              color: Colors.blue.shade100,
                                              shadowColor: Colors.black,
                                              child: Padding(
                                                //padding:  EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 0),
                                                child: Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      25, 25, 25, 10),
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 0,
                                                        right: 0,
                                                        top: 0,
                                                        bottom: 0),
                                                    child: Column(
                                                      children: [
                                                        TextFormField(
                                                          //controller: emailController,
                                                          keyboardType:
                                                              TextInputType
                                                                  .emailAddress,
                                                          cursorColor:
                                                              Colors.blue,
                                                          decoration:
                                                              InputDecoration(
                                                            fillColor:
                                                                Colors.blue,
                                                            focusColor:
                                                                Colors.blue,
                                                            hoverColor:
                                                                Colors.blue,
                                                            suffixIcon: Icon(Icons
                                                                .mail_outlined),
                                                            border:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color:
                                                                    Colors.blue,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(Radius
                                                                          .circular(
                                                                              5)),
                                                            ),
                                                            //labelStyle: TextStyle(color: Colors.amber),
                                                            labelText: 'Boy',
                                                            hintText:
                                                                'Boyunuz...',
                                                            hintStyle:
                                                                TextStyle(
                                                              color:
                                                                  Colors.blue,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                    width: 3,
                                                    color:
                                                        Colors.blue.shade300),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15)),
                                              ),
                                            )),
                                        SizedBox(height: 20),
                                        Text("Yağ Miktarı Hesaplama"),
                                        SizedBox(height: 20),
                                        Container(
                                            margin: EdgeInsets.fromLTRB(
                                                5, 25, 5, 10),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.60,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.75,
                                            child: Card(
                                              color: Colors.blue.shade100,
                                              shadowColor: Colors.black,
                                              child: Padding(
                                                //padding:  EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 0),
                                                child: Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      25, 25, 25, 10),
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 0,
                                                        right: 0,
                                                        top: 0,
                                                        bottom: 0),
                                                    child: Column(
                                                      children: [
                                                        TextFormField(
                                                          //controller: emailController,
                                                          keyboardType:
                                                              TextInputType
                                                                  .emailAddress,
                                                          cursorColor:
                                                              Colors.blue,
                                                          decoration:
                                                              InputDecoration(
                                                            fillColor:
                                                                Colors.blue,
                                                            focusColor:
                                                                Colors.blue,
                                                            hoverColor:
                                                                Colors.blue,
                                                            suffixIcon: Icon(Icons
                                                                .mail_outlined),
                                                            border:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color:
                                                                    Colors.blue,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(Radius
                                                                          .circular(
                                                                              5)),
                                                            ),
                                                            //labelStyle: TextStyle(color: Colors.amber),
                                                            labelText: 'Boy',
                                                            hintText:
                                                                'Boyunuz...',
                                                            hintStyle:
                                                                TextStyle(
                                                              color:
                                                                  Colors.blue,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                    width: 3,
                                                    color:
                                                        Colors.blue.shade300),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15)),
                                              ),
                                            )),
                                      ],
                                    ),
                                    buttons: [
                                      DialogButton(
                                        width:
                                            MediaQuery.of(context).size.height *
                                                0.15,
                                        border: Border.all(
                                            width: 3,
                                            color: Colors.blue.shade400),
                                        color: Colors.blue.shade300,
                                        radius: BorderRadius.all(
                                            Radius.circular(15)),
                                        onPressed: () async {},
                                        child: Text(
                                          "Hesapla",
                                          style: GoogleFonts.patrickHand(
                                            fontSize: 24,
                                            color: Colors.pink.shade900,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      )
                                    ]).show();
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
                                              'assets/img/drugstore.png'))),
                                  Text(
                                    "Nöbetçi Eczaneler",
                                    style: GoogleFonts.amaticSc(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color: Colors.pink.shade900),
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
                                        color: Colors.pink.shade900),
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
                                              'assets/img/check-up.png'))),
                                  Text(
                                    "Bazal Metabolizmamı Hesapla",
                                    style: GoogleFonts.amaticSc(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color: Colors.pink.shade900),
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
                                              'assets/img/water.png'))),
                                  Text(
                                    "Su İhtiyacım",
                                    style: GoogleFonts.amaticSc(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color: Colors.pink.shade900),
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
                                              'assets/img/night.png'))),
                                  Text(
                                    "Uyku Sürem",
                                    style: GoogleFonts.amaticSc(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color: Colors.pink.shade900),
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
