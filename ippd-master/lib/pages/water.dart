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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  color: Colors.blue.shade200,
                  child: Text(
                    "Hesapla",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: water,
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
                  : "${_result.toStringAsFixed(2)} Litre",
              style: TextStyle(
                color: Colors.pink.shade900,
                fontSize: 19.4,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void water() {
    double weight = double.parse(_weightController.text);

    double result = weight * 0.03;

    _result = result;

    setState(() {});
  }

  void _clear() {
    setState(() {
      _weightController.clear();
    });
  }
}
