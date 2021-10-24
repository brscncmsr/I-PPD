import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ippd/home/login.dart';

class ContactNurse extends StatefulWidget {
  ContactNurse({Key? key}) : super(key: key);

  @override
  _ContactNurseState createState() => _ContactNurseState();
}

class _ContactNurseState extends State<ContactNurse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Hemşilere Ulaşın',
              style: GoogleFonts.balooThambi(color: Colors.blue)),
          //centerTitle: true,
          backgroundColor: Colors.blue.shade200,
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Center(
                child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Geliştirme Aşamasındadır",
                style: GoogleFonts.patrickHand(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
              ),
            )),
          ),
        ));
  }
}
