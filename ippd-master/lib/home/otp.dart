import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ippd/home/home.dart';
import 'package:ippd/pages/homepage.dart';
import 'package:pinput/pin_put/pin_put.dart';

class OTP extends StatefulWidget {
  final String phone;
  final String codeDigits;

  OTP({required this.phone, required this.codeDigits});

  @override
  _OTPState createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  final TextEditingController _pincontroller = TextEditingController();
  final FocusNode _pinOTP = FocusNode();
  String? varcode;

  final BoxDecoration pinOTPDec = BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.grey));

  void initState() {
    super.initState();

    verifyphonenumber();
  }

  verifyphonenumber() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '${widget.codeDigits + widget.phone}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) {
            if (value.user != null) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (c) => Home()));
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(e.message.toString()),
            duration: Duration(seconds: 3),
          ));
        },
        codeSent: (String? vID, int? resentToken) {
          setState(() {
            varcode = vID;
          });
        },
        codeAutoRetrievalTimeout: (String? vID)
    {
      setState(() {
        varcode = vID;
      });
    },
    timeout: Duration(seconds: 60),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  verifyphonenumber();
                },
                child: Text(
                  'Verifying : ${widget.codeDigits}-${widget.phone}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.all(40),
              child: PinPut(
                fieldsCount: 6,
                textStyle: TextStyle(fontSize: 25, color: Colors.white),
                eachFieldWidth: 40,
                eachFieldHeight: 55,
                focusNode: _pinOTP,
                controller: _pincontroller,
                submittedFieldDecoration: pinOTPDec,
                selectedFieldDecoration: pinOTPDec,
                followingFieldDecoration: pinOTPDec,
                pinAnimationType: PinAnimationType.rotation,
                onSubmit: (pin) async {
                  try {
                    await FirebaseAuth.instance
                        .signInWithCredential(PhoneAuthProvider.credential(
                            verificationId: varcode!, smsCode: pin))
                        .then((value) {
                      if (value.user != null) {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (c) => Anasayfa()));
                      }
                    });
                  } catch (e) {
                    FocusScope.of(context).unfocus();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Invalid OTP"),
                      duration: Duration(seconds: 3),
                    ));
                  }
                },
              ))
        ],
      ),
    );
  }
}
