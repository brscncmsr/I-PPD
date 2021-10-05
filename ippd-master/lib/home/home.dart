import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ippd/pages/exercise.dart';
import 'package:ippd/pages/homepage.dart';
import 'package:ippd/pages/notifications.dart';
import 'package:ippd/pages/profil.dart';
import 'package:line_icons/line_icons.dart';

class Anasayfa extends StatefulWidget {
  Anasayfa({Key? key}) : super(key: key);

  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  Future<Null> refresh() async {
    await Future.delayed(Duration(seconds: 2));
  }

  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Home(),
    Exercise(),
    Bildirim(),
    Profil(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          //brightness: Brightness.dark,
          ),
      home: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: Container(
          width: MediaQuery.of(context).size.height * 0.96,
          height: MediaQuery.of(context).size.height * 0.085,
          child: SafeArea(
            child: GNav(
              haptic: true,
              tabBorderRadius: 15,
              curve: Curves.bounceIn,
              backgroundColor: Colors.blue.shade200,
              textStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink.shade900),
              rippleColor: Colors.pink.shade800,
              hoverColor: Colors.amber, //pink.shade900,
              gap: 5,
              activeColor: Colors.pink.shade900,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              duration: Duration(milliseconds: 600),
              tabBackgroundColor: Colors.grey.shade300,
              color: Colors.pink.shade900,
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Anasayfa',
                ),
                GButton(
                  icon: Icons.run_circle_rounded,
                  text: 'Egzersiz Planı',
                ),
                GButton(
                  icon: Icons.notifications_active,
                  text: 'Bildirimler',
                ),
                GButton(
                  icon: CupertinoIcons.profile_circled,
                  text: 'Profil',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.blue.shade200,
          title: Center(
            child: Text(
              "I-PPD",
              style: GoogleFonts.patrickHand(
                  color: Colors.pink.shade900,
                  fontSize: 35,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}

void onPressed() {}
