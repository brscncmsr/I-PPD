import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ippd/pages/water.dart';

class Exercise extends StatefulWidget {
  Exercise({Key? key}) : super(key: key);
  String _rsttext = "rsttex";
  void exercise(
      {double BmI = 0, double Bmh = 0, double water = 0, String sleep = ""}) {
    if (BmI != 0) {
      _rsttext = "a";
    }
    ExerciseState().State();
  }

  @override
  ExerciseState createState() => ExerciseState();
}

class ExerciseState extends State<Exercise> {
  Future<Null> refresh() async {
    await Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          //brightness: Brightness.dark,
          ),
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/img/background.png'),
                  repeat: ImageRepeat.repeat,
                  colorFilter:
                      ColorFilter.mode(Colors.white60, BlendMode.color),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: 950,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.only(top: 10),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 3, color: Colors.blue.shade200),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: ListView(children: [
                      ListTile(
                        contentPadding: EdgeInsets.all(10),
                        title: Text(Exercise()._rsttext),
                        subtitle: Text("Günde .. kez"),
                        //leading: resim olabilir burda küçük  Icon(Icons.add),
                        trailing:
                            Icon(Icons.arrow_forward_ios_rounded), //sonuna ikon
                      ),
                    ]),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void State(
      {double BmI = 0, double Bmh = 0, double water = 0, String sleep = ""}) {
    setState(() {});
  }
}
