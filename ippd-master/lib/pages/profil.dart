import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profil extends StatefulWidget {
  Profil({Key? key}) : super(key: key);

  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
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
              child: 
              Scaffold(
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
                  
                  height: 950,
                  margin: EdgeInsets.all(10),
                  padding:EdgeInsets.only(
                    top:10
                  ),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 3, color: Colors.red.shade200),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: ListView(
               children: [
                 ListTile(
                   contentPadding: EdgeInsets.all(10),
                   title: Text("Ad Soyad"),
                  subtitle: Text("Bilgi"),
                   leading: Icon(CupertinoIcons.profile_circled),  //başına ikon
                   trailing: Icon(Icons.arrow_forward_ios_rounded),  //sonuna ikon
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
                ),
      ),
    );
  }
}