import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ippd/login/pages/widgets/sign_up2.dart';
import 'package:page_transition/page_transition.dart';

class Want extends StatefulWidget {
  const Want({Key? key}) : super(key: key);

  @override
  _WantState createState() => _WantState();
}

class _WantState extends State<Want> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          height: MediaQuery.of(context).size.height * 1.9,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 60,
              ),
              Text("Neyi?,Ne İçin İstiyoruz?",
                  style: GoogleFonts.charm(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  )),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: Text(
                  "Uygulamamızda hastalık risklerinizi, beden kitle indeksinizi, bazal metabolizma hızınızı, gerekli uyku sürenizi, günlük su ihtiyacınızı hesaplamak için birazdan çıkan ekrandaki bilglerinize ihtiyacımız olacak bu veriler doğrultusunda gerekli hesaplamalarınız yapılarak size uygun egzersiz planlarınızı uygulayabileceksiniz.",
                  style: GoogleFonts.charm(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              FlatButton(
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                      width: 3, color: Colors.blue, style: BorderStyle.solid),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                onPressed: () => Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      duration: Duration(milliseconds: 500),
                      child: SignUp2(),
                    )),
                child: Text(
                  "İleri",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).textScaleFactor * 17,
                      fontFamily: "Times New Roman",
                      fontWeight: FontWeight.normal,
                      color: Colors.pink.shade900),
                ),
              )
            ],
          ),
        ));
  }
}
