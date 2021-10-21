import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:ippd/pages/sleep.dart';
import 'package:ippd/pages/water.dart';
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

  bool status1 = false;
  bool status2 = false;
  bool status3 = false;
  bool status4 = false;
  bool status5 = false;

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
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/img/background.png'),
                  repeat: ImageRepeat.repeat,
                  colorFilter:
                      ColorFilter.mode(Colors.white60, BlendMode.color),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: 525,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.only(top: 10),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 3, color: Colors.blue.shade200),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: ListView(
                      children: [
                        status1
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                    TextField(
                                      controller: _nameController,
                                      keyboardType: TextInputType.name,
                                      decoration: InputDecoration(
                                        //counterText: 'max değeri geçmeyiniz',
                                        helperText:
                                            _usersStream.first.toString(),
                                        icon: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                            child: Image(
                                                fit: BoxFit.fill,
                                                image: AssetImage(
                                                    'assets/img/nurse.png'))),
                                        labelText: 'Adınız ve Soyadınız',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                      ),
                                    ),
                                    FlatButton(
                                        color: Colors.blue,
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              width: 3,
                                              color: Colors.blue.shade300),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                        ),
                                        child: Text(
                                          "Kaydet",
                                          style: GoogleFonts.patrickHand(
                                            fontSize: 24,
                                            color: Colors.white60,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        onPressed: () => getMenu()),
                                  ])
                            : ListTile(
                                contentPadding: EdgeInsets.all(10),
                                title: Text("Email Adresiniz"),
                                subtitle: Text('boy'),
                                leading: Icon(CupertinoIcons
                                    .person_crop_circle_fill), //başına ikon
                                trailing: Icon(Icons.arrow_forward_ios_rounded),
                                onTap: () => {name()},

                                //sonuna ikon
                              ),
                        status2
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                    TextField(
                                      controller: _heightController,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        //counterText: 'max değeri geçmeyiniz',
                                        helperText: 'Örnek olarak 160',
                                        icon: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                            child: Image(
                                                fit: BoxFit.fill,
                                                image: AssetImage(
                                                    'assets/img/height.png'))),
                                        labelText: 'Boyunuzu Giriniz',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                      ),
                                    ),
                                    FlatButton(
                                        color: Colors.blue,
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              width: 3,
                                              color: Colors.blue.shade300),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                        ),
                                        child: Text(
                                          "Kaydet",
                                          style: GoogleFonts.patrickHand(
                                            fontSize: 24,
                                            color: Colors.white60,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        onPressed: () => getMenu()),
                                  ])
                            : ListTile(
                                contentPadding: EdgeInsets.all(10),
                                title: Text("Boy"),
                                subtitle:
                                    Text(_usersStream.elementAt(0).toString()),
                                leading: Icon(Icons.height), //başına ikon
                                trailing: Icon(Icons.arrow_forward_ios_rounded),
                                onTap: () => {height("a")}, //sonuna ikon
                              ),
                        status3
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                    TextField(
                                      controller: _weightController,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        //counterText: 'max değeri geçmeyiniz',
                                        helperText: 'Örnek olarak 80',
                                        icon: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                            child: Image(
                                                fit: BoxFit.fill,
                                                image: AssetImage(
                                                    'assets/img/weight.png'))),
                                        labelText: 'Kilonuzu Giriniz',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                      ),
                                    ),
                                    FlatButton(
                                        color: Colors.blue,
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              width: 3,
                                              color: Colors.blue.shade300),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                        ),
                                        child: Text(
                                          "Kaydet",
                                          style: GoogleFonts.patrickHand(
                                            fontSize: 24,
                                            color: Colors.white60,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        onPressed: () async {
                                          SharedPreferences prefs =
                                              await SharedPreferences
                                                  .getInstance();
                                          final value = prefs.getDouble(
                                              _weightController.text);

                                          getMenu();
                                        }),
                                  ])
                            : ListTile(
                                contentPadding: EdgeInsets.all(10),
                                title: Text("Kilo"),
                                subtitle:
                                    Text('Kilonuz ${_weightController.text}'),
                                leading:
                                    Icon(Icons.fitness_center), //başına ikon
                                trailing: Icon(Icons.arrow_forward_ios_rounded),
                                onTap: () => {weight()}, //sonuna ikon
                              ),
                        status4
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                    TextField(
                                      controller: _ageController,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        //counterText: 'max değeri geçmeyiniz',
                                        helperText: 'Örnek olarak 20',
                                        icon: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                            child: Image(
                                                fit: BoxFit.fill,
                                                image: AssetImage(
                                                    'assets/img/age.png'))),
                                        labelText: 'Yaşınızı Giriniz',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                      ),
                                    ),
                                    FlatButton(
                                        color: Colors.blue,
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              width: 3,
                                              color: Colors.blue.shade300),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                        ),
                                        child: Text(
                                          "Kaydet",
                                          style: GoogleFonts.patrickHand(
                                            fontSize: 24,
                                            color: Colors.white60,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        onPressed: () {
                                          getMenu();
                                        }),
                                  ])
                            : ListTile(
                                contentPadding: EdgeInsets.all(10),
                                title: Text("Yaş"),
                                subtitle: Text(_age),
                                leading: Icon(CupertinoIcons
                                    .person_crop_circle_fill), //başına ikon
                                trailing: Icon(Icons.arrow_forward_ios_rounded),
                                onTap: () => {
                                  age(),
                                }, //sonuna ikon
                              ),
                        ListTile(
                          contentPadding: EdgeInsets.all(10),
                          title: Text("Kan Grubu"),
                          subtitle: Text("Bilgi"),
                          leading: Icon(Icons.bloodtype), //başına ikon
                          trailing: Icon(
                              Icons.arrow_forward_ios_rounded), //sonuna ikon
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.all(10),
                          title: Text("Telefon Numaranız"),
                          subtitle: Text("Bilgi"),
                          leading: Icon(Icons.phone), //başına ikon
                          trailing: Icon(
                              Icons.arrow_forward_ios_rounded), //sonuna ikon
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
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
                      "Çıkış Yap",
                      style: GoogleFonts.patrickHand(
                        fontSize: 24,
                        color: Colors.white60,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () => FirebaseAuth.instance.signOut(),
                  ),
                ),
                SizedBox(height: 30)
              ],
            ),
          ),
        ),
      ),
    );
  }

  void name() {
    status1 = true;
    setState(() {});
  }

  void height(String height) {
    status2 = true;
    double heightp = double.parse(height);
    _height = "Boyunuz $height";

    setState(() {});
  }

  void weight() {
    status3 = true;
    setState(() {});
  }

  void age() {
    status4 = true;
    setState(() {});
  }

  void gender() {
    setState(() {});
  }

  Future<void> getMenu() async {
    double weightp = double.parse(_weightController.text);
    double heightp = double.parse(_heightController.text);
    double agep = double.parse(_ageController.text);

    _name = _nameController.text;

    _height = "Boyunuz ${_heightController.text}";
    _weight = "Kilonuz ${_weightController.text}";
    _age = "Yaşınız ${_ageController.text}";

    status1 = false;
    status2 = false;
    status3 = false;
    status4 = false;

    setState(() {});
  }
}
