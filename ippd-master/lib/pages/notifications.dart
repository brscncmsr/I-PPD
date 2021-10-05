import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Bildirim extends StatefulWidget {
  Bildirim({Key? key}) : super(key: key);

  @override
  _BildirimState createState() => _BildirimState();
}

class _BildirimState extends State<Bildirim> {
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
          image:  DecorationImage(
              image: AssetImage('assets/img/background.png'),
              repeat: ImageRepeat.repeat,
              colorFilter:
                  ColorFilter.mode(Colors.white60, BlendMode.color),
              fit: BoxFit.cover)),
          
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  
                  height: 550,
                  margin: EdgeInsets.all(10),
                  padding:EdgeInsets.only(
                    top:10
                  ),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 3, color: Colors.blue.shade200),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: ListView(
               children: [
                 ListTile(
                   contentPadding: EdgeInsets.all(10),
                   title: Text("Egzersiz Takibi"),
                  subtitle: Text("Egzersiz Bilgisi"),
                   leading: Icon(Icons.notifications_active),  //başına ikon
                 ),
                 
               ],
             ),
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
}