import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ippd/home/home.dart';
import 'package:ippd/login/pages/login_page.dart';
import 'package:ippd/login/pages/widgets/sign_up2.dart';
import 'package:ippd/pages/homepage.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profil extends StatefulWidget {
  Profil({Key? key}) : super(key: key);

  @override
  _ProfilState createState() => _ProfilState();
}

User? user = FirebaseAuth.instance.currentUser;
final TextEditingController _heightController = TextEditingController();
final TextEditingController _weightController = TextEditingController();
final TextEditingController _nameController = TextEditingController();
final TextEditingController _ageController = TextEditingController();

class _ProfilState extends State<Profil> {
  Future<Null> refresh() async {
    await Future.delayed(
      Duration(seconds: 2),
    );
  }

  final db = FirebaseFirestore.instance;
  final Stream<QuerySnapshot<Map<String, dynamic>>> _usersStream =
      FirebaseFirestore.instance
          .collection('users')
          .where("email", isEqualTo: user!.email)
          .snapshots();

  String _name = "";
  String _height = "";
  String _weight = "Kilonuzu Girin";
  String _age = "Yaşınızı Girin";
  double weightp = 0.0;
  double heightp = 0.0;
  double agep = 0.0;
  bool a = false;
  bool status1 = false;
  bool status2 = false;
  bool status3 = false;
  bool status4 = false;
  bool status5 = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          //brightness: Brightness.dark,
          ),
      home: Scaffold(
          body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            Container(
              height: 525,
              margin: EdgeInsets.all(7),
              padding: EdgeInsets.only(top: 10),
              child: Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 3, color: Colors.blue.shade200),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: ListView(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.all(5),
                      title: Text(
                        "Email Adresiniz",
                        style: TextStyle(
                            fontFamily: "Times New Roman",
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize:
                                MediaQuery.of(context).textScaleFactor * 16),
                      ),
                      subtitle: Text(
                        user!.email.toString(),
                        style: TextStyle(
                            fontFamily: "Times New Roman",
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            fontSize:
                                MediaQuery.of(context).textScaleFactor * 16),
                      ),

                      leading: Icon(
                          CupertinoIcons.person_crop_circle_fill), //başına ikon

                      onTap: () => {},

                      //sonuna ikon
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.all(5),
                      title: Text(
                        "Boyunuz",
                        style: TextStyle(
                            fontFamily: "Times New Roman",
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize:
                                MediaQuery.of(context).textScaleFactor * 16),
                      ),
                      subtitle: StreamBuilder<DocumentSnapshot>(
                          stream:
                              db.collection("users").doc(user!.uid).snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return CircularProgressIndicator();
                            }
                            return Text(
                              snapshot.data!["boy"],
                              style: TextStyle(
                                  fontFamily: "Times New Roman",
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                  fontSize:
                                      MediaQuery.of(context).textScaleFactor *
                                          16),
                            );
                          }),
                      leading: Icon(Icons.height), //başına ikon

                      onTap: () => {}, //sonuna ikon
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.all(5),
                      title: Text(
                        "Kilonuz",
                        style: TextStyle(
                            fontFamily: "Times New Roman",
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize:
                                MediaQuery.of(context).textScaleFactor * 16),
                      ),
                      subtitle: StreamBuilder<DocumentSnapshot>(
                          stream:
                              db.collection("users").doc(user!.uid).snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return CircularProgressIndicator();
                            }
                            return Text(
                              snapshot.data!["kilo"],
                              style: TextStyle(
                                  fontFamily: "Times New Roman",
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                  fontSize:
                                      MediaQuery.of(context).textScaleFactor *
                                          16),
                            );
                          }),
                      leading: Icon(Icons.fitness_center), //başına ikon

                      onTap: () => {}, //sonuna ikon
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.all(5),
                      title: Text(
                        "Yaşınız",
                        style: TextStyle(
                            fontFamily: "Times New Roman",
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize:
                                MediaQuery.of(context).textScaleFactor * 16),
                      ),
                      subtitle: StreamBuilder<DocumentSnapshot>(
                          stream:
                              db.collection("users").doc(user!.uid).snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return CircularProgressIndicator();
                            }
                            return Text(
                              snapshot.data!["yas"],
                              style: TextStyle(
                                  fontFamily: "Times New Roman",
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                  fontSize:
                                      MediaQuery.of(context).textScaleFactor *
                                          16),
                            );
                          }),
                      leading: Icon(
                          CupertinoIcons.person_crop_circle_fill), //başına ikon

                      onTap: () => {}, //sonuna ikon
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.all(5),
                      title: Text(
                        "Bel Çevresi",
                        style: TextStyle(
                            fontFamily: "Times New Roman",
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize:
                                MediaQuery.of(context).textScaleFactor * 16),
                      ),
                      subtitle: StreamBuilder<DocumentSnapshot>(
                          stream:
                              db.collection("users").doc(user!.uid).snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return CircularProgressIndicator();
                            }
                            return Text(
                              snapshot.data!["bel"],
                              style: TextStyle(
                                  fontFamily: "Times New Roman",
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                  fontSize:
                                      MediaQuery.of(context).textScaleFactor *
                                          16),
                            );
                          }),
                      leading: Icon(CupertinoIcons.metronome), //başına ikon

                      onTap: () => {}, //sonuna ikon
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.all(5),
                      title: Text(
                        "Cinsiyetiniz",
                        style: TextStyle(
                            fontFamily: "Times New Roman",
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize:
                                MediaQuery.of(context).textScaleFactor * 16),
                      ),
                      subtitle: StreamBuilder<DocumentSnapshot>(
                          stream:
                              db.collection("users").doc(user!.uid).snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return CircularProgressIndicator();
                            }
                            return Text(
                              snapshot.data!["cinsiyet"],
                              style: TextStyle(
                                  fontFamily: "Times New Roman",
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                  fontSize:
                                      MediaQuery.of(context).textScaleFactor *
                                          16),
                            );
                          }),
                      leading: Icon(CupertinoIcons.person_fill), //başına ikon

                      onTap: () => {}, //sonuna ikon
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Colors.blue.shade200,
                  ),
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 3, color: Colors.blue.shade300),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Text(
                      "Düzenle",
                      style: GoogleFonts.roboto(
                        fontSize: 20,
                        color: Colors.pink.shade900,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => SignUp2())),
                  ),
                ),
                SizedBox(width: 30),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Colors.blue.shade200,
                  ),
                  width: MediaQuery.of(context).size.height * 0.17,
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: FlatButton(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 3, color: Colors.blue.shade300),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Text(
                        "Çıkış",
                        style: GoogleFonts.roboto(
                          fontSize: 20,
                          color: Colors.pink.shade900,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () async {
                        var sharedPreferences =
                            await SharedPreferences.getInstance();
                        sharedPreferences.setInt("count", 0);
                        FirebaseAuth.instance.signOut();
                        Navigator.push(
                            context,
                            PageTransition(
                                child: LoginPage(),
                                type: PageTransitionType.bottomToTop));
                        sharedPreferences.setInt("count", 0);
                      }),
                ),
              ],
            ),
          ]),
        ),
      )),
    );
  }
}
