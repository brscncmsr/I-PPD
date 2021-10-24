import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ippd/pages/water.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:line_icons/line_icons.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';

class Exercise extends StatefulWidget {
  Exercise({Key? key}) : super(key: key);

  @override
  ExerciseState createState() => ExerciseState();
}

class ExerciseState extends State<Exercise> {
  Future<Null> refresh() async {
    await Future.delayed(Duration(seconds: 2));
  }

  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('egzersizler')
      //.orderBy()
      //.where('yas',isGreaterThanOrEqualTo: )
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          //brightness: Brightness.dark,
          ),
      home: Scaffold(
        body: RefreshIndicator(
          onRefresh: refresh,
          backgroundColor: Colors.blue.shade300,
          color: Colors.blue,
          child: StreamBuilder<QuerySnapshot>(
              stream: _usersStream,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                      child: CircularProgressIndicator(
                    color: Colors.blue,
                    strokeWidth: 2,
                  ));
                }
                return ListView(
                  children: snapshot.data!.docs.map(
                    (DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                      return ListTile(
                        contentPadding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        title: Card(
                            color: Colors.blue.shade100,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 2,
                                  color: Colors.blue.shade300,
                                  style: BorderStyle.solid),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            margin: EdgeInsets.all(0),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    /*leading: Icon(Icons.cases_outlined,
                                  color: Colors.amber),*/
                                    title: Text(
                                      data['egzersiz'],
                                      style: GoogleFonts.patrickHand(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24),
                                    ),
                                    subtitle: Text(data['günlük'],
                                        style: GoogleFonts.patrickHand(
                                          fontSize: 21,
                                          color: Colors.blue.shade300,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                  ButtonTheme(
                                      child: ButtonBar(children: <Widget>[
                                    Container(
                                      width: 90,
                                      height: 45,
                                      child: FlatButton(
                                        color: Colors.blue.shade300,
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              width: 3,
                                              color: Colors.blue,
                                              style: BorderStyle.solid),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: Text(
                                          "İncele",
                                          style: GoogleFonts.patrickHand(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 24),
                                        ),
                                        onPressed: () {
                                          Alert(
                                            onWillPopActive: true,
                                            closeIcon: Container(
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      width: 3,
                                                      color: Colors.red),
                                                ),
                                                padding: EdgeInsets.all(2),
                                                child: Icon(
                                                    Icons.close_outlined,
                                                    size: 25,
                                                    color: Colors.red)),
                                            style: AlertStyle(
                                              isButtonVisible: false,
                                              backgroundColor:
                                                  Colors.white70,
                                              alertElevation: 10,
                                              alertPadding: EdgeInsets.all(10),
                                              overlayColor:
                                                  Colors.white,
                                              animationType:
                                                  AnimationType.shrink,
                                              animationDuration:
                                                  Duration(milliseconds: 600),
                                              alertBorder:
                                                  RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(25)),
                                                side: BorderSide(
                                                  color: Colors.white,
                                                  width: 3,
                                                ),
                                              ),
                                            ),
                                            title: data['egzersiz'],
                                            
                                            context: context,
                                            content: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Container(
                                                    margin: EdgeInsets.fromLTRB(
                                                        5, 25, 5, 10),
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.60,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            2.25,
                                                    child: Card(
                                                      
                                                      color:
                                                          Colors.white,
                                                      shadowColor: Colors.black,
                                                      child: Padding(
                                                        //padding:  EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 0),
                                                        child: Container(
                                                          margin: EdgeInsets
                                                              .fromLTRB(25, 25,
                                                                  25, 10),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 0,
                                                                    right: 0,
                                                                    top: 0,
                                                                    bottom: 0),
                                                            child: Column(
                                                              children: [
                                                                Container(
                                                                  margin:
                                                                      EdgeInsets
                                                                          .all(
                                                                              5),
                                                                  child: Text(
                                                                    "${data['egzersiz']} için Bilgiler",
                                                                    style: TextStyle(fontFamily : 'Roboto',
                                                                        fontSize:
                                                                            24,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  margin:
                                                                      EdgeInsets
                                                                          .all(
                                                                              5),
                                                                  child: Text(
                                                                    "${data['bas']}",
                                                                    style: TextStyle(fontFamily : 'Roboto',
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.normal),
                                                                  ),
                                                                ),
                                                                Container(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        0.3,
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        0.295,
                                                                    child: Stack(
                                                                      children: [
                                                                        Image(

                                                                            fit: BoxFit
                                                                                .fill,
                                                                            image: NetworkImage(
                                                                                '${data['image']}')),
                                                                                Positioned(
                                                                                  bottom:45,
                                                                                  right:0,
                                                                                  child:
                                                                                Container(
                                                                                  alignment: Alignment.bottomRight,
                                                                                  color:Colors.white,
                                                                                width: MediaQuery.of(context).size.width *0.12,
                                                                                height: MediaQuery.of(context).size.height * 0.023,
                                                                                ))
                                                                      ],
                                                                    )),
                                                                            SizedBox(height:10),
                                                                  Container(
                                                                  margin:
                                                                      EdgeInsets
                                                                          .all(
                                                                              5),
                                                                  child: Text(
                                                                    '${data['1.satır']}',
                                                                    style: TextStyle(fontFamily : 'Roboto',
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.normal),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  margin:
                                                                      EdgeInsets
                                                                          .all(
                                                                              5),
                                                                  child: Text(
                                                                    '${data['2.satır']}',
                                                                    style: TextStyle(fontFamily : 'Roboto',
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.normal),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  margin:
                                                                      EdgeInsets
                                                                          .all(
                                                                              5),
                                                                  child: Text(
                                                                    '${data['3.satır']}',
                                                                    style: TextStyle(fontFamily : 'Roboto',
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.normal),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  margin:
                                                                      EdgeInsets
                                                                          .all(
                                                                              5),
                                                                  child: Text(
                                                                    '${data['4.satır']}',
                                                                    style: TextStyle(fontFamily : 'Roboto',
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.normal),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  margin:
                                                                      EdgeInsets
                                                                          .all(
                                                                              5),
                                                                  child: Text(
                                                                    '${data['5.satır']}',
                                                                    style: TextStyle(fontFamily : 'Roboto',
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.normal),
                                                                  ),
                                                                ),
                                                                Center(
                                                                  child:Container(
                                                                  margin:
                                                                      EdgeInsets
                                                                          .all(
                                                                              5),
                                                                  child: Text(
                                                                    'Uygun Form Ve Nefes Modeli',
                                                                    style: TextStyle(fontFamily : 'Roboto',
                                                                        fontSize:
                                                                            21,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                                ),
                                                                SizedBox(height:10),
                                                                  Container(
                                                                  margin:
                                                                      EdgeInsets
                                                                          .all(
                                                                              5),
                                                                  child: Text(
                                                                    '${data['baslık2']}',
                                                                    style: TextStyle(fontFamily : 'Roboto',
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.normal),
                                                                  ),
                                                                ),
                                                                SizedBox(height:10),
                                                                  Container(
                                                                  margin:
                                                                      EdgeInsets
                                                                          .all(
                                                                              5),
                                                                  child: Text(
                                                                    'Egzersiz Faydaları',
                                                                    style: TextStyle(fontFamily : 'Roboto',
                                                                        fontSize:
                                                                            21,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                                  Container(
                                                                  margin:
                                                                      EdgeInsets
                                                                          .all(
                                                                              5),
                                                                  child: Text(
                                                                    '${data['egzersizfay']}',
                                                                    style: TextStyle(fontFamily : 'Roboto',
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.normal),
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
                                        },
                                      ),
                                    ),
                                  ]))
                                ])),
                      );
                    },
                  ).toList(),
                );
              }),
        ),
      ),
    );
  }
}