import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:ippd/pages/profil.dart';

class Water extends StatefulWidget {
  Water({Key? key});

  @override
  _WaterState createState() => _WaterState();
}

class _WaterState extends State<Water> {

  @override
  final TextEditingController _weightController = TextEditingController();

  double _result = 0.0;
  double bardak = 0.0;
  var x = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Günlük Su İhtiyacı',style:GoogleFonts.balooThambi(color:Colors.blue)),
        centerTitle: true,
        backgroundColor: Colors.blue.shade200,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.all(10.0)),
              SizedBox(height: 20),
              SizedBox(
                width: 300,
                child: TextField(
                  maxLength: 3,
                  controller: _weightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    counterText: '',
                    helperText: 'Örneğin 80 olarak girebilirsiniz',
                    helperStyle: GoogleFonts.patrickHand(
                        fontWeight: FontWeight.bold, fontSize: 18),
                    icon: Container(
                        width: MediaQuery.of(context).size.height * 0.05,
                        height: MediaQuery.of(context).size.height * 0.05,
                        child: Image(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/img/weight.png'))),
                    labelText: 'Kilo kg cinsinden',
                    labelStyle: GoogleFonts.patrickHand(
                        fontWeight: FontWeight.bold, fontSize: 18),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(10.0)),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton(
                    color: Colors.blue.shade300,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          width: 3,
                          color: Colors.blue,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Text(
                      "Profilden",
                      style: GoogleFonts.patrickHand(
                          color: Colors.white60,
                          fontWeight: FontWeight.bold,
                          fontSize: 21),
                    ),
                    onPressed: (){},
                  ),
                  SizedBox(width: 20),
                  FlatButton(
                      color: Colors.blue.shade300,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            width: 3,
                            color: Colors.blue,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Text(
                        "Hesapla",
                        style: GoogleFonts.patrickHand(
                            color: Colors.white60,
                            fontWeight: FontWeight.bold,
                            fontSize: 21),
                      ),
                      onPressed: () {
                        water();
                        Get.to(Profil(), arguments: _weightController);
                      }),
                  SizedBox(width: 20),
                  FlatButton(
                    color: Colors.blue.shade300,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          width: 3,
                          color: Colors.blue,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Text(
                      "Temizle",
                      style: GoogleFonts.patrickHand(
                          color: Colors.white60,
                          fontWeight: FontWeight.bold,
                          fontSize: 21),
                    ),
                    onPressed: _clear,
                  ),
                ],
              ),
              SizedBox(height: 15),
              Text(
                _result == null
                    ? "Değeri Gir"
                    : "Günde ortalama ${_result.toStringAsFixed(1)} litre su içmelisiniz.",
                style: GoogleFonts.patrickHand(
                  color: Colors.pink.shade900,
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15),
              Text(
                _result == null
                    ? "Değeri Gir"
                    : "ve bu günde ${bardak.ceil()} bardak suya eşdeğerdir.",
                style: GoogleFonts.patrickHand(
                  color: Colors.pink.shade900,
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                children: [
                  Row(
                    children: <Widget>[
                      for (int i = 0; i < bardak; i++)
                        i < 8
                            ? Container(
                                width:
                                    MediaQuery.of(context).size.height * 0.06,
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                child: Image(
                                    fit: BoxFit.cover,
                                    image: AssetImage('assets/img/water.png')),
                              )
                            : Container()
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      for (int i = 8; i < bardak; i++)
                        i < 16
                            ? Container(
                                width:
                                    MediaQuery.of(context).size.height * 0.06,
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                child: Image(
                                    fit: BoxFit.cover,
                                    image: AssetImage('assets/img/water.png')),
                              )
                            : Container()
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      for (int i = 16; i < bardak; i++)
                        i < 24
                            ? Container(
                                width:
                                    MediaQuery.of(context).size.height * 0.06,
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                child: Image(
                                    fit: BoxFit.cover,
                                    image: AssetImage('assets/img/water.png')),
                              )
                            : Container()
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void water() {
    double weight = double.parse(_weightController.text);
    double result = weight * 0.03;
    result.toStringAsFixed(1);
    _result = result;
    bardak = result / 0.2;
    setState(() {});
  }

  void _clear() {
    setState(() {
      _weightController.clear();
    });
  }
}
