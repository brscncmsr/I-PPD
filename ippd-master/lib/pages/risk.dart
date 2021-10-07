import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_button/group_button.dart';
import 'package:ippd/pages/bmi.dart';
import 'package:page_transition/page_transition.dart';

class Risk extends StatefulWidget {
  Risk({Key? key}) : super(key: key);

  @override
  _RiskState createState() => _RiskState();
}

class _RiskState extends State<Risk> {
  int select = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hastalık Riski Hesapla'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade200,
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(20),
                height: 80,
                color: Colors.blue.shade900,
                child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: Blood(),
                              type: PageTransitionType.bottomToTop));
                    },
                    child: Row(
                      children: [
                        Image(image: AssetImage("assets/img/blood.png")),
                        SizedBox(width: 10),
                        Text("Kan Uyuşmazlığı Riskimi Hesapla"),
                      ],
                    )),
              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(20),
                height: 80,
                color: Colors.blue.shade500,
                child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: BmI(),
                              type: PageTransitionType.bottomToTop));
                    },
                    child: Row(
                      children: [
                        Image(image: AssetImage("assets/img/obesite.png")),
                        SizedBox(width: 10),
                        Text("Obezite Riskimi Hesapla"),
                      ],
                    )),
              ),
            ],
          )),
    );
  }
}

class Blood extends StatefulWidget {
  Blood({Key? key}) : super(key: key);

  @override
  _BloodState createState() => _BloodState();
}

class _BloodState extends State<Blood> {
  String _rsttext = "";
  int mrh = 0;
  int mselect = 0;
  int frh = 0;
  int fselect = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Kan Uyuşmazlığı Riski'),
          centerTitle: true,
          backgroundColor: Colors.blue.shade200,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.all(10.0)),
                        SizedBox(height: 20),
                        Text("Anne Rh Durumu"),
                        SizedBox(height: 20),
                        GroupButton(
                          direction: Axis.horizontal,
                          selectedTextStyle: GoogleFonts.roboto(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold),
                          unselectedTextStyle:
                              GoogleFonts.roboto(color: Colors.black87),
                          isRadio: true,
                          selectedBorderColor: Colors.blue.shade300,
                          selectedColor: Colors.blue.shade200,
                          unselectedColor: Colors.blue.shade100,
                          unselectedBorderColor: Colors.blue,
                          spacing: 10,
                          buttons: const [
                            '+',
                            '-',
                          ],
                          borderRadius: BorderRadius.circular(30),
                          onSelected: (i, selected) => mrh = i,
                        ),
                        Text("Anne Kan Grubu"),
                        SizedBox(height: 20),
                        GroupButton(
                          direction: Axis.vertical,
                          selectedTextStyle: GoogleFonts.roboto(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold),
                          unselectedTextStyle:
                              GoogleFonts.roboto(color: Colors.black87),
                          isRadio: true,
                          selectedBorderColor: Colors.blue.shade300,
                          selectedColor: Colors.blue.shade200,
                          unselectedColor: Colors.blue.shade100,
                          unselectedBorderColor: Colors.blue,
                          spacing: 10,
                          buttons: const [
                            'A',
                            'B',
                            'AB',
                            '0',
                          ],
                          borderRadius: BorderRadius.circular(30),
                          onSelected: (i, selected) => mselect = i,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.all(10.0)),
                        SizedBox(height: 20),
                        Text("Baba Rh Durumu"),
                        SizedBox(height: 20),
                        GroupButton(
                          direction: Axis.horizontal,
                          selectedTextStyle: GoogleFonts.roboto(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold),
                          unselectedTextStyle:
                              GoogleFonts.roboto(color: Colors.black87),
                          isRadio: true,
                          selectedBorderColor: Colors.blue.shade300,
                          selectedColor: Colors.blue.shade200,
                          unselectedColor: Colors.blue.shade100,
                          unselectedBorderColor: Colors.blue,
                          spacing: 10,
                          buttons: const [
                            '+',
                            '-',
                          ],
                          borderRadius: BorderRadius.circular(30),
                          onSelected: (i, selected) => frh = i,
                        ),
                        Text("Baba Kan Grubu"),
                        SizedBox(height: 20),
                        GroupButton(
                          direction: Axis.vertical,
                          selectedTextStyle: GoogleFonts.roboto(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold),
                          unselectedTextStyle:
                              GoogleFonts.roboto(color: Colors.black87),
                          isRadio: true,
                          selectedBorderColor: Colors.blue.shade300,
                          selectedColor: Colors.blue.shade200,
                          unselectedColor: Colors.blue.shade100,
                          unselectedBorderColor: Colors.blue,
                          spacing: 10,
                          buttons: const [
                            'A',
                            'B',
                            'AB',
                            '0',
                          ],
                          borderRadius: BorderRadius.circular(30),
                          onSelected: (i, selected) => fselect = i,
                        ),
                        SizedBox(width: 20),
                      ],
                    ),
                  ]),
              Container(
                padding: EdgeInsets.all(10),
                child: RaisedButton(
                    color: Colors.blue.shade200,
                    child: Text(
                      "Riski Hesapla",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      calcRisk();
                    }),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.1,
                child: Text(
                  _rsttext,
                  style: TextStyle(
                    color: Colors.pink.shade900,
                    fontSize: 15.4,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  void calcRisk() {
    if (mrh == 1 && frh == 0) {
      _rsttext = "Gebelik Sürecinde Kan Uyuşmazlığı Riski olabilir.";
    } else {
      _rsttext = "Herhangi bir Kan Uyuşmazlığı Riskiniz Yoktur.";
    }
    setState(() {});
  }
}
