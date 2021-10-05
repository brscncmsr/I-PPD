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
                  
                  height: 525,
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
                   title: Text("Ad Soyad"),
                  subtitle: Text("Bilgi"),
                   leading: Icon(CupertinoIcons.person_crop_circle_fill),  //başına ikon
                   trailing: Icon(Icons.arrow_forward_ios_rounded),  //sonuna ikon
                 ),
                 ListTile(
                   contentPadding: EdgeInsets.all(10),
                   title: Text("Boy"),
                  subtitle: Text("Bilgi"),
                   leading: Icon(Icons.height),  //başına ikon
                   trailing: Icon(Icons.arrow_forward_ios_rounded),  //sonuna ikon
                 ),
                 ListTile(
                   contentPadding: EdgeInsets.all(10),
                   title: Text("Kilo"),
                  subtitle: Text("Bilgi"),
                   leading: Icon(Icons.fitness_center),  //başına ikon
                   trailing: Icon(Icons.arrow_forward_ios_rounded),  //sonuna ikon
                 ),
                 ListTile(
                   contentPadding: EdgeInsets.all(10),
                   title: Text("Yaş"),
                  subtitle: Text("Bilgi"),
                   leading: Icon(CupertinoIcons.person_crop_circle_fill),  //başına ikon
                   trailing: Icon(Icons.arrow_forward_ios_rounded),  //sonuna ikon
                 ),
                 ListTile(
                   contentPadding: EdgeInsets.all(10),
                   title: Text("Kan Grubu"),
                  subtitle: Text("Bilgi"),
                   leading: Icon(Icons.bloodtype),  //başına ikon
                   trailing: Icon(Icons.arrow_forward_ios_rounded),  //sonuna ikon
                 ),
                 ListTile(
                   contentPadding: EdgeInsets.all(10),
                   title: Text("Telefon Numaranız"),
                  subtitle: Text("Bilgi"),
                   leading: Icon(Icons.phone),  //başına ikon
                   trailing: Icon(Icons.arrow_forward_ios_rounded),  //sonuna ikon
                 ),
               ],
             ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                   decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                                  color:
                                  Colors.blue.shade200,
                                
                              ),
                            
                  width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height *
                                                                    0.17,
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height *
                                                                    0.06,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 3, color: Colors.blue.shade300),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                                                                
                                                                onPressed:
                                                                    (){},
                                                                child: Text(
                                                                  "Çıkış Yap",
                                                                  style: GoogleFonts
                                                                      .patrickHand(
                                                                    fontSize: 24,
                                                                    color: Colors
                                                                        .white60,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                              ),
                ),
                SizedBox(height:30)
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