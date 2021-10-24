import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_button/group_button.dart';
import 'package:ippd/pages/bmi.dart';
import 'package:ippd/pages/diabet.dart';
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
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(4),
                height: 100,
                child: FlatButton(
                    color: Colors.indigo.shade300,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          width: 3,
                          color: Colors.indigo.shade700,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: Blood(),
                              type: PageTransitionType.bottomToTop));
                    },
                    child: Row(
                      children: [
                        Image(
                            height: 60,
                            image: AssetImage("assets/img/blood.png")),
                        SizedBox(width: 10),
                        Text("Kan Uyuşmazlığı\nRiskimi Hesapla",
                            style: GoogleFonts.patrickHand(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24)),
                      ],
                    )),
              ),
              Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(4),
                height: 100,
                width: MediaQuery.of(context).size.width * 0.75,
                //color: Colors.blue.shade500,
                child: FlatButton(
                    color: Colors.blue.shade300,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          width: 3,
                          color: Colors.blue.shade700,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: BmI(),
                              type: PageTransitionType.bottomToTop));
                    },
                    child: Row(
                      children: [
                        Image(
                            height: 60,
                            image: AssetImage("assets/img/obesite.png")),
                        SizedBox(width: 5),
                        Text("Obezite Riskimi Hesapla",
                            style: GoogleFonts.patrickHand(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24)),
                      ],
                    )),
              ),
              Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(4),
                height: 100,
                child: FlatButton(
                    color: Colors.lightBlue.shade500,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          width: 3,
                          color: Colors.lightBlue.shade700,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: Diabet(),
                              type: PageTransitionType.bottomToTop));
                    },
                    child: Row(
                      children: [
                        Image(
                            height: 60,
                            image: AssetImage("assets/img/diabet.png")),
                        SizedBox(width: 10),
                        Text("Diyabet Riskimi Hesapla",
                            style: GoogleFonts.patrickHand(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24)),
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
          title: Text('Kan Uyuşmazlığı Riski',
              style: GoogleFonts.balooThambi(color: Colors.blue)),
          //centerTitle: true,
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
                        Text("Anne Rh Durumu",
                            style: GoogleFonts.patrickHand(
                                fontWeight: FontWeight.bold, fontSize: 18)),
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
                        Text("Anne Kan Grubu",
                            style: GoogleFonts.patrickHand(
                                fontWeight: FontWeight.bold, fontSize: 18)),
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
                        Text("Baba Rh Durumu",
                            style: GoogleFonts.patrickHand(
                                fontWeight: FontWeight.bold, fontSize: 18)),
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
                        Text("Baba Kan Grubu",
                            style: GoogleFonts.patrickHand(
                                fontWeight: FontWeight.bold, fontSize: 18)),
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
                child: FlatButton(
                    color: Colors.blue.shade300,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          width: 3,
                          color: Colors.blue,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Text(
                      "Riski Hesapla",
                      style: GoogleFonts.patrickHandSc(
                          color: Colors.white60,
                          fontWeight: FontWeight.bold,
                          fontSize: 21),
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
                  style: GoogleFonts.patrickHand(
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

class Diabet extends StatefulWidget {
  Diabet({Key? key}) : super(key: key);

  @override
  _DiabetState createState() => _DiabetState();
}

class _DiabetState extends State<Diabet> {
  String? _value;
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        margin: EdgeInsets.fromLTRB(60, 0, 50, 50),
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          border: Border.all(
              color: Colors.black12, style: BorderStyle.solid, width: 0.80),
        ),
        child: DropdownButton<String>(
          elevation: 8,
          value: null,
          style: TextStyle(color: Colors.black87, fontSize: 16),
          icon: Icon(Icons.arrow_drop_down_circle),
          iconEnabledColor: Colors.blue,
          hint: Text("Şuan Diyabet Hastası Mısınız?"),
          items: <String>["Evet", "Hayır"]
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _value = newValue!;
              _isSelected = true;
            });
          },
        ),
      ),
      ConstrainedBox(
        constraints: BoxConstraints.tightFor(width: 250, height: 50),
        child: FlatButton(
          color: Colors.blue,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 3, color: Colors.blue.shade300),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          onPressed: _isSelected
              ? () {
                  setState(() {
                    _isSelected = false;
                  });
                  checkDiase();
                }
              : null,
          child: Text(
            "Onayla",
            style: GoogleFonts.patrickHand(
              fontSize: 24,
              color: Colors.white60,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      )
    ]));
  }

  void checkDiase() {
    if (_value == "Evet") {
      Navigator.push(
          context,
          PageTransition(
              child: DiabetRisk(), type: PageTransitionType.bottomToTop));
    } else if (_value == "Hayır") {
      Navigator.push(context,
          PageTransition(child: Risk(), type: PageTransitionType.bottomToTop));
    }
  }
}
