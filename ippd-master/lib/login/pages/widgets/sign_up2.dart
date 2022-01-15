import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_button/group_button.dart';
import 'package:ippd/home/home.dart';
import 'package:ippd/login/theme.dart';
import 'package:ippd/login/widgets/snackbar.dart';
import 'package:ippd/pages/bmi.dart';

class SignUp2 extends StatefulWidget {
  const SignUp2({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

int select = 0;

class _SignUpState extends State<SignUp2> {
  final FocusNode focusNodePassword = FocusNode();
  final FocusNode focusNodeConfirmPassword = FocusNode();
  final FocusNode focusNodeEmail = FocusNode();
  final FocusNode focusNodeName = FocusNode();

  User? user = FirebaseAuth.instance.currentUser;

  bool _obscureTextPassword = true;
  bool _obscureTextConfirmPassword = true;

  TextEditingController signupEmailController = TextEditingController();
  TextEditingController signupboyController = TextEditingController();
  TextEditingController signupkiloController = TextEditingController();
  TextEditingController signupyasController = TextEditingController();
  TextEditingController signupPasswordController = TextEditingController();
  TextEditingController signupbellyController = TextEditingController();
  TextEditingController signupConfirmPasswordController =
      TextEditingController();
  bool _isSelected = false;
  String? _interest;

  @override
  void dispose() {
    focusNodePassword.dispose();
    focusNodeConfirmPassword.dispose();
    focusNodeEmail.dispose();
    focusNodeName.dispose();
    super.dispose();
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
    return Scaffold(
        body: Container(
            padding: const EdgeInsets.only(top: 23.0),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                      width: MediaQuery.of(context).size.width * 1,
                      height: MediaQuery.of(context).size.height * 1.5,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: <Color>[
                              CustomTheme.loginGradientStart,
                              CustomTheme.loginGradientEnd
                            ],
                            begin: FractionalOffset(0.0, 0.0),
                            end: FractionalOffset(1.0, 1.0),
                            stops: <double>[0.0, 1.0],
                            tileMode: TileMode.clamp),
                      ),
                      child: Column(mainAxisSize: MainAxisSize.max, children: <
                          Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Image(
                              height: MediaQuery.of(context).size.height * 0.3,
                              fit: BoxFit.fill,
                              image: const AssetImage('assets/img/ippd.png')),
                        ),
                        Stack(
                          alignment: Alignment.topCenter,
                          children: <Widget>[
                            Card(
                              elevation: 2.0,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Container(
                                width: 300.0,
                                height: 450.0,
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 20.0,
                                          bottom: 20.0,
                                          left: 25.0,
                                          right: 25.0),
                                      child: TextField(
                                        controller: signupboyController,
                                        maxLength: 3,
                                        keyboardType: TextInputType.number,
                                        style: TextStyle(
                                            fontFamily: 'Times New Roman',
                                            fontSize: 16.0,
                                            color: Colors.black),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          icon: Icon(
                                            FontAwesomeIcons.envelope,
                                            color: Colors.black,
                                            size: 22.0,
                                          ),
                                          counterText: '',
                                          hintText: 'Boy',
                                          hintStyle: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .textScaleFactor *
                                                  17,
                                              fontFamily: "Times New Roman",
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        onSubmitted: (_) {
                                          focusNodePassword.requestFocus();
                                        },
                                      ),
                                    ),
                                    Container(
                                      width: 250.0,
                                      height: 1.0,
                                      color: Colors.grey[400],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 20.0,
                                          bottom: 20.0,
                                          left: 25.0,
                                          right: 25.0),
                                      child: TextField(
                                        controller: signupkiloController,
                                        keyboardType: TextInputType.number,
                                        maxLength: 3,
                                        style: TextStyle(
                                            fontFamily: 'Times New Roman',
                                            fontSize: 16.0,
                                            color: Colors.black),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          icon: Icon(
                                            FontAwesomeIcons.envelope,
                                            color: Colors.black,
                                            size: 22.0,
                                          ),
                                          counterText: '',
                                          hintText: 'Kilo',
                                          hintStyle: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .textScaleFactor *
                                                  17,
                                              fontFamily: "Times New Roman",
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        onSubmitted: (_) {
                                          focusNodePassword.requestFocus();
                                        },
                                      ),
                                    ),
                                    Container(
                                      width: 250.0,
                                      height: 1.0,
                                      color: Colors.grey[400],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 20.0,
                                          bottom: 20.0,
                                          left: 25.0,
                                          right: 25.0),
                                      child: TextField(
                                        controller: signupyasController,
                                        keyboardType: TextInputType.number,
                                        maxLength: 3,
                                        style: TextStyle(
                                            fontFamily: 'Times New Roman',
                                            fontSize: 16.0,
                                            color: Colors.black),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          icon: Icon(
                                            FontAwesomeIcons.envelope,
                                            color: Colors.black,
                                            size: 22.0,
                                          ),
                                          counterText: '',
                                          hintText: 'Yaş',
                                          hintStyle: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .textScaleFactor *
                                                  17,
                                              fontFamily: "Times New Roman",
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        onSubmitted: (_) {
                                          focusNodePassword.requestFocus();
                                        },
                                      ),
                                    ),
                                    Container(
                                      width: 250.0,
                                      height: 1.0,
                                      color: Colors.grey[400],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 20.0,
                                          bottom: 20.0,
                                          left: 25.0,
                                          right: 25.0),
                                      child: TextField(
                                        controller: signupbellyController,
                                        keyboardType: TextInputType.number,
                                        maxLength: 3,
                                        style: TextStyle(
                                            fontFamily: 'Times New Roman',
                                            fontSize: 16.0,
                                            color: Colors.black),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          icon: Icon(
                                            FontAwesomeIcons.envelope,
                                            color: Colors.black,
                                            size: 22.0,
                                          ),
                                          counterText: '',
                                          hintText: 'Bel Çevresi',
                                          hintStyle: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .textScaleFactor *
                                                  17,
                                              fontFamily: "Times New Roman",
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        onSubmitted: (_) {
                                          focusNodePassword.requestFocus();
                                        },
                                      ),
                                    ),
                                    Container(
                                      width: 250.0,
                                      height: 1.0,
                                      color: Colors.grey[400],
                                    ),
                                    DropdownButton<String>(
                                      elevation: 8,
                                      style: TextStyle(
                                          color: Colors.black87, fontSize: 16),
                                      icon: Icon(Icons.arrow_drop_down_circle),
                                      iconEnabledColor: Colors.blue,
                                      hint: _isSelected
                                          ? Text(
                                              "$_interest",
                                              style: TextStyle(
                                                  color: Colors.black),
                                            )
                                          : Text(
                                              " Cinsiyetiniz ?",
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                      items: <String>["Kadın", "Erkek"]
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
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
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 150,
                              height: 50,
                              margin: const EdgeInsets.only(top: 425.0),
                              child: FlatButton(
                                  color: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 3, color: Colors.blue.shade700),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                  ),
                                  child: Text(
                                    'Kaydol',
                                    style: TextStyle(
                                        fontSize: MediaQuery.of(context)
                                                .textScaleFactor *
                                            24,
                                        fontFamily: "Times New Roman",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.pink.shade900),
                                  ),
                                  onPressed: () async {
                                    if (signupbellyController.text == "" ||
                                        signupboyController.text == "" ||
                                        signupkiloController.text == "" ||
                                        signupyasController.text == "" ||
                                        _interest == "") {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackbar1);
                                    } else {
                                      await FirebaseFirestore.instance
                                          .collection("users")
                                          .doc(user!.uid)
                                          .set({
                                        'yas': signupyasController.text,
                                        'boy': signupboyController.text,
                                        'kilo': signupkiloController.text,
                                        'bel': signupbellyController.text,
                                        'cinsiyet': _interest,
                                        'userid': user!.uid
                                      }).then((_) => {
                                                Navigator.of(context)
                                                    .pushReplacement(
                                                        MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    Anasayfa()))
                                              });
                                    }
                                  }),
                            )
                          ],
                        ),
                      ])),
                ],
              ),
            )));
  }

  void _toggleSignUpButton() {
    CustomSnackBar(context, const Text('SignUp2 button pressed'));
  }

  void _toggleSignup() {
    setState(() {
      _obscureTextPassword = !_obscureTextPassword;
    });
  }

  void _toggleSignupConfirm() {
    setState(() {
      _obscureTextConfirmPassword = !_obscureTextConfirmPassword;
    });
  }
}
