import 'package:flutter/material.dart';

class Water extends StatefulWidget {
  Water({Key? key}) : super(key: key);

  @override
  _WaterState createState() => _WaterState();
}

class _WaterState extends State<Water> {
  @override
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  double _result = 0.0;
  double bardak = 0.0;
  var x = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Günlük Su İhtiyacı'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade200,
      ),
      body: Container(
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
                              //counterText: 'max değeri geçmeyiniz',
                              helperText: 'Örneğin 80 olarak girebilirsiniz',
                              icon: Container(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        0.05,
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        0.05,
                                                                    child: Image(
              fit: BoxFit.fill,
              image: AssetImage('assets/img/weight.png'))),
                              labelText: 'Kilo kg cinsinden',
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
                RaisedButton(
                  color: Colors.blue.shade200,
                  child: Text(
                    "Hesapla",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    water();
                  },
                ),
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
            Text(
              _result == null
                  ? "Değeri Gir"
                  : "Günde ortalama ${_result.toStringAsFixed(1)} litre su içmelisiniz.",
              style: TextStyle(
                color: Colors.pink.shade900,
                fontSize: 19.4,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 15),
            Text(
              _result == null
                  ? "Değeri Gir"
                  : "ve bu günde ${bardak.toStringAsFixed(1)} bardak suya eşdeğerdir.",
              style: TextStyle(
                color: Colors.pink.shade900,
                fontSize: 19.4,
                fontWeight: FontWeight.w500,
              ),
            ),
            Column(
              children: [
                Row(
                  children: <Widget>[
                    for (int i = 0; i < bardak; i++)
                      i < 8
                          ? Container(
                              width: MediaQuery.of(context).size.height * 0.06,
                              height: MediaQuery.of(context).size.height * 0.06,
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
                      i < 15
                          ? Container(
                              width: MediaQuery.of(context).size.height * 0.06,
                              height: MediaQuery.of(context).size.height * 0.06,
                              child: Image(
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/img/water.png')),
                            )
                          : Container()
                  ],
                ),
                Row(
                  children: <Widget>[
                    for (int i = 15; i < bardak; i++)
                      i < 23
                          ? Container(
                              width: MediaQuery.of(context).size.height * 0.06,
                              height: MediaQuery.of(context).size.height * 0.06,
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
    );
  }

  void water() {
    double weight = double.parse(_weightController.text);

    double result = weight * 0.03;
    result.toStringAsFixed(1);
    _result = result;
    bardak = result / 0.2;
      if(bardak % 0.5 == 0)
      {
      
      }
      else
      {
        
      }

    setState(() {});
  }

  void _clear() {
    setState(() {
      _weightController.clear();
    });
  }
}
