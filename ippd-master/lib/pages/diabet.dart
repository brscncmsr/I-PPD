import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_button/group_button.dart';

class DiabetRisk extends StatefulWidget {
  DiabetRisk({Key? key}) : super(key: key);

  @override
  _DiabetRiskState createState() => _DiabetRiskState();
}

class _DiabetRiskState extends State<DiabetRisk> {
  @override
  bool _isInitialValue = true;

  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _bellyController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  double _result = 0.0;
  int select = 0;
  double _fontsize = 14;
  String _textR = "";
  String _img = "assets/img/MBMI-0.png";
  String _imgn = "assets/img/nurse3.png";
  String sugges1 = "";
  String sugges2 = "";
  String sugges3 = "";
  bool isobes = false;
  bool isrisky = false;
  bool checkbelly = false;
  Color _colortext = Colors.pink.shade900;
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Diyabet Risk Hesabı',
              style: GoogleFonts.balooThambi(color: Colors.blue)),
          centerTitle: true,
          backgroundColor: Colors.blue.shade200,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.all(10.0)),
                SizedBox(
                  width: 300,
                  child: TextField(
                    maxLength: 3,
                    controller: _heightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      counterText: '',
                      helperText: 'Örneğin 160 olarak girebilirsiniz',
                      helperStyle: TextStyle(fontFamily: 'Roboto'),
                      icon: Container(
                          width: MediaQuery.of(context).size.height * 0.05,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: Image(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/img/height.png'))),
                      labelText: 'Boy cm cinsinden',
                      labelStyle: TextStyle(fontFamily: "Roboto"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                ),
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
                      helperStyle: TextStyle(fontFamily: 'Roboto'),
                      icon: Container(
                          width: MediaQuery.of(context).size.height * 0.05,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: Image(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/img/weight.png'))),
                      labelText: 'Kilo kg cinsinden',
                      labelStyle: TextStyle(fontFamily: 'Roboto'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(10.0)),
                SizedBox(height: 20),
                SizedBox(
                  width: 300,
                  child: TextField(
                    maxLength: 3,
                    controller: _bellyController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      counterText: '',
                      helperText: 'Örneğin 40 olarak girebilirsiniz',
                      helperStyle: TextStyle(fontFamily: 'Roboto'),
                      icon: Container(
                          width: MediaQuery.of(context).size.height * 0.05,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: Image(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/img/bel.png'))),
                      labelText: 'Bel cm cinsinden',
                      labelStyle: TextStyle(fontFamily: 'Roboto'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(10.0)),
                SizedBox(height: 20),
                SizedBox(
                  width: 300,
                  child: TextField(
                    maxLength: 2,
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      counterText: '',
                      helperText: 'Örneğin 40 olarak girebilirsiniz',
                      helperStyle: TextStyle(fontFamily: 'Roboto'),
                      icon: Container(
                          width: MediaQuery.of(context).size.height * 0.05,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: Image(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/img/age.png'))),
                      labelText: 'Yaşınız',
                      labelStyle: TextStyle(fontFamily: 'Roboto'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(10.0)),
                SizedBox(height: 20),
                GroupButton(
                  selectedTextStyle: TextStyle(
                      fontFamily: "Roboto",
                      color: Colors.black87,
                      fontWeight: FontWeight.bold),
                  unselectedTextStyle:
                      TextStyle(fontFamily: "Roboto", color: Colors.black87),
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
                ),
                Padding(padding: EdgeInsets.all(10.0)),
                SizedBox(height: 20),
                Text(
                    "Genel Olarak Boş Zamanlarınızda Günde En Az 30 dakika yürüyüş yapar mısınız?"),
                GroupButton(
                  selectedTextStyle: TextStyle(
                      fontFamily: "Roboto",
                      color: Colors.black87,
                      fontWeight: FontWeight.bold),
                  unselectedTextStyle:
                      TextStyle(fontFamily: "Roboto", color: Colors.black87),
                  isRadio: true,
                  selectedBorderColor: Colors.blue.shade300,
                  selectedColor: Colors.blue.shade200,
                  unselectedColor: Colors.blue.shade100,
                  unselectedBorderColor: Colors.blue,
                  spacing: 10,
                  buttons: const [
                    "Evet",
                    'Hayır',
                  ],
                  borderRadius: BorderRadius.circular(30),
                  onSelected: (i, selected) => select = i,
                ),
                FlatButton(
                  color: Colors.blue.shade300,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        width: 3, color: Colors.blue, style: BorderStyle.solid),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Text(
                    "Bilgileri Getir",
                    style: TextStyle(
                        fontFamily: "Roboto",
                        color: Colors.white60,
                        fontWeight: FontWeight.bold,
                        fontSize: 21),
                  ),
                  onPressed: () {},
                ),
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
                        "Hesapla",
                        style: TextStyle(
                            fontFamily: "Roboto",
                            color: Colors.white60,
                            fontWeight: FontWeight.bold,
                            fontSize: 21),
                      ),
                      onPressed: () => {},
                    ),
                    SizedBox(width: 10),
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
                        style: TextStyle(
                            fontFamily: "Roboto",
                            color: Colors.white60,
                            fontWeight: FontWeight.bold,
                            fontSize: 21),
                      ),
                      onPressed: () => {},
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        sugges3,
                        style: TextStyle(
                          fontFamily: "Roboto",
                          color: Colors.blue.shade200,
                          fontSize: _fontsize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Image(image: AssetImage(_imgn))
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Image(image: AssetImage(_img)),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Text(
                          _result == null ? "Değeri Gir" : _textR,
                          style: TextStyle(
                            fontFamily: "Roboto",
                            color: _colortext,
                            fontSize: 19.4,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          width: _isInitialValue
                              ? MediaQuery.of(context).size.width * 0.1
                              : MediaQuery.of(context).size.width * 0.3,
                          height: _isInitialValue
                              ? MediaQuery.of(context).size.width * 0.2
                              : MediaQuery.of(context).size.width * 0.4,
                          child: Text(
                            sugges1,
                            style: TextStyle(
                              fontFamily: "Roboto",
                              color: _colortext,
                              fontSize: 15.4,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: Text(
                            sugges2,
                            style: TextStyle(
                              fontFamily: "Roboto",
                              color: _colortext,
                              fontSize: 15.4,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
