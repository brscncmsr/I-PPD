import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ippd/login/pages/widgets/sign_up2.dart';
import 'package:ippd/login/pages/widgets/whatwewant.dart';
import 'package:ippd/login/widgets/snackbar.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

int select = 0;

class _SignUpState extends State<SignUp> {
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
  TextEditingController signupConfirmPasswordController =
      TextEditingController();

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
    return Container(
      padding: const EdgeInsets.only(top: 23.0),
      child: Column(
        children: <Widget>[
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
                  height: 285.0,
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 250.0,
                        height: 1.0,
                        color: Colors.grey[400],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                        child: TextField(
                          controller: signupEmailController,
                          keyboardType: TextInputType.emailAddress,
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
                            hintText: 'Email Adresi',
                            hintStyle: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).textScaleFactor * 12,
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
                            top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                        child: TextField(
                          controller: signupPasswordController,
                          obscureText: _obscureTextPassword,
                          style: const TextStyle(
                              fontFamily: 'Times New Roman',
                              fontSize: 16.0,
                              color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: const Icon(
                              FontAwesomeIcons.lock,
                              size: 22.0,
                              color: Colors.black,
                            ),
                            hintText: 'Şifre',
                            hintStyle: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).textScaleFactor * 12,
                                fontFamily: "Times New Roman",
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            suffixIcon: GestureDetector(
                              onTap: _toggleSignup,
                              child: Icon(
                                _obscureTextPassword
                                    ? FontAwesomeIcons.eye
                                    : FontAwesomeIcons.eyeSlash,
                                size: 15.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          onSubmitted: (_) {
                            _toggleSignUpButton();
                          },
                          textInputAction: TextInputAction.go,
                        ),
                      ),
                      Container(
                        width: 250.0,
                        height: 1.0,
                        color: Colors.grey[400],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                        child: TextField(
                          controller: signupConfirmPasswordController,
                          obscureText: _obscureTextPassword,
                          style: const TextStyle(
                              fontFamily: 'Times New Roman',
                              fontSize: 16.0,
                              color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: const Icon(
                              FontAwesomeIcons.lock,
                              size: 22.0,
                              color: Colors.black,
                            ),
                            hintText: 'Şifre Tekrar',
                            hintStyle: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).textScaleFactor * 12,
                                fontFamily: "Times New Roman",
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            suffixIcon: GestureDetector(
                              onTap: _toggleSignup,
                              child: Icon(
                                _obscureTextPassword
                                    ? FontAwesomeIcons.eye
                                    : FontAwesomeIcons.eyeSlash,
                                size: 15.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          onSubmitted: (_) {
                            _toggleSignUpButton();
                          },
                          textInputAction: TextInputAction.go,
                        ),
                      ),
                      /* GroupButton(
                        selectedTextStyle: GoogleFonts.patrickHand(
                            color: Colors.black87, fontWeight: FontWeight.bold),
                        unselectedTextStyle:
                            GoogleFonts.patrickHand(color: Colors.black87),
                        isRadio: true,
                        selectedBorderColor: Colors.blue.shade300,
                        selectedColor: Colors.blue.shade200,
                        unselectedColor: Colors.blue.shade100,
                        unselectedBorderColor: Colors.blue,
                        spacing: 10,
                        buttons: const [
                          'Kadın',
                          'Erkek',
                        ],
                        borderRadius: BorderRadius.circular(30),
                        onSelected: (i, selected) => select = i,
                      ),*/
                    ],
                  ),
                ),
              ),
              Container(
                width: 150,
                height: 50,
                margin: const EdgeInsets.only(top: 260.0),
                child: FlatButton(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 3, color: Colors.blue.shade700),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Text(
                    'Kaydol',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).textScaleFactor * 18,
                        fontFamily: "Times New Roman",
                        fontWeight: FontWeight.bold,
                        color: Colors.pink.shade900),
                  ),
                  onPressed: () async {
                    await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                          email: signupEmailController.text,
                          password: signupPasswordController.text,
                        )
                        .then((_) => {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => Want()))
                            });
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  void _toggleSignUpButton() {
    CustomSnackBar(context, const Text('SignUp button pressed'));
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
