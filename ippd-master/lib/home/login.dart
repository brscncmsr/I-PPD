import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ippd/home/otp.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

User? user = FirebaseAuth.instance.currentUser;

String dialCodeDigits = '';
TextEditingController _controller = TextEditingController();
String tex = _controller.text;

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 250,
          child: Text("Sizi Tanıyabilmemiz İçin Adınızı ve Soyadınızı Giriniz",
              style: GoogleFonts.amaticSc(
                height: 1.5,
                fontWeight: FontWeight.normal,
                fontSize: 18,
                letterSpacing: 0.5,
              )),
        ),
        SizedBox(
          width: 400,
          height: 60,
        ),
        Container(
          width: 250,
          child: TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.blue,
                  width: 2,
                ),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 2),
              ),
              suffixIcon: Icon(Icons.person),
              labelText: 'Ad ve Soyadı',
              hintText: 'Adınızı ve Soyadınızı girin..',
              hintStyle: TextStyle(
                color: Colors.blue,
              ),
              prefix: Padding(
                padding: EdgeInsets.all(4),
              ),
            ),
          ),
        ),
        FlatButton(
          onPressed: () {},
          child: Text(
            "Başla",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        )
      ],
    );
  }
}
