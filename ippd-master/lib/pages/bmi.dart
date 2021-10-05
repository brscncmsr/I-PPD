import 'package:flutter/material.dart';
import 'package:ippd/pages/exercise.dart';
import 'package:ippd/pages/func.dart';

class BmI extends StatefulWidget {
  BmI({Key? key}) : super(key: key);

  @override
  _BmIState createState() => _BmIState();
}

class _BmIState extends State<BmI> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _bellyController = TextEditingController();

  double _result = 0.0;
  String _textR = "";
  String _img = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Vücut Kitle Endeksi'),
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
                TextField(
                  controller: _heightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Boy cm cinsinden',
                    icon: Icon(Icons.trending_up),
                  ),
                ),
                Padding(padding: EdgeInsets.all(10.0)),
                SizedBox(height: 20),
                TextField(
                  controller: _weightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Kilo kg cinsinden',
                    icon: Icon(Icons.line_weight),
                  ),
                ),
                Padding(padding: EdgeInsets.all(10.0)),
                SizedBox(height: 20),
                TextField(
                  controller: _bellyController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Bel Çevresi',
                    icon: Icon(Icons.line_weight),
                  ),
                ),
                Padding(padding: EdgeInsets.all(10.0)),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                        color: Colors.blue.shade200,
                        child: Text(
                          "Hesapla",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          calculateBMI();
                        }),
                    SizedBox(width: 20),
                    RaisedButton(
                      color: Colors.blue.shade200,
                      child: Text(
                        "Temizle",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: _clear,
                    ),
                  ],
                ),
                SizedBox(height: 15),
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
                            color: Colors.pink.shade900,
                            fontSize: 19.4,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: Text(
                            "Beslenme durumunuzun değerlendirilmesi için diyetisyene danışınız.",
                            style: TextStyle(
                              color: Colors.pink.shade900,
                              fontSize: 15.4,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: Text(
                            "Fiziksel aktivite için uygulamamızda bulunan yaşınıza uygun egzersiz planlarına erişim sağlayabilirsiniz.",
                            style: TextStyle(
                              color: Colors.pink.shade900,
                              fontSize: 15.4,
                              fontWeight: FontWeight.w500,
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

  void calculateBMI() {
    double height = double.parse(_heightController.text) / 100;
    double weight = double.parse(_weightController.text);
    double belly = double.parse(_bellyController.text);

    double heightSquare = height * height;
    double result = weight / heightSquare;

    _result = result;
    if (result < 18.5) {
      _textR = "Zayıf";
      _img = "assets/img/MBMI-1.png";
    } else if (result >= 18.5 && result <= 24.9) {
      _textR = "Normal";
      _img = "assets/img/MBMI-2.png";
    } else if (result >= 25 && result <= 29.9) {
      _textR = "Fazla Kilolu";
      _img = "assets/img/MBMI-3.png";
    } else if (result >= 30 && result <= 34.9) {
      _textR = "Obez";
      _img = "assets/img/MBMI-4.png";
    } else if (result >= 35 && result <= 39.9) {
      _textR = "Ağır Obez";
      _img = "assets/img/MBMI-5.png";
    } else if (result >= 40) {
      _textR = "Aşırı Obez";
      _img = "assets/img/MBMI-6.png";
    }
    setState(() {});
  }

  void _clear() {
    setState(() {
      _weightController.clear();
      _heightController.clear();
    });
  }
}
