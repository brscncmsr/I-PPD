import 'dart:async';

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ippd/language.dart';
import 'package:ippd/localekeys.dart';
import 'package:ippd/pages/exercise.dart';
import 'package:ippd/pages/homepage.dart';
import 'package:ippd/pages/notifications.dart';
import 'package:ippd/pages/profil.dart';
import 'package:line_icons/line_icons.dart';
import 'package:page_transition/page_transition.dart';

class Anasayfa extends StatefulWidget {
  Anasayfa({Key? key}) : super(key: key);

  @override
  _AnasayfaState createState() => _AnasayfaState();
}

int _selectedIndex = 0;
int count = 0;

class _AnasayfaState extends State<Anasayfa> {
  Future<Null> refresh() async {
    await Future.delayed(Duration(seconds: 2));
  }

  static List<Widget> _widgetOptions = <Widget>[
    Home(),
    Exercise(),
    Bildirim(),
    Profil(),
  ];
  bool a = true;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_selectedIndex == 0) {
          Timer(Duration(seconds: 3), () {
            setState(() {
              count = 0;
            });
          });
          count += 1;
          if (count == 3) {
            SystemNavigator.pop();
            count = 0;
          }
        } else if (_selectedIndex == 1) {
          _selectedIndex = 0;
          Navigator.push(
              context,
              PageTransition(
                  child: Anasayfa(), type: PageTransitionType.leftToRight));
        } else if (_selectedIndex == 2) {
          _selectedIndex = 0;
          Navigator.push(
              context,
              PageTransition(
                  child: Anasayfa(), type: PageTransitionType.leftToRight));
        } else if (_selectedIndex == 3) {
          _selectedIndex = 0;
          Navigator.push(
              context,
              PageTransition(
                  child: Anasayfa(), type: PageTransitionType.leftToRight));
          _selectedIndex = 0;
        }
        setState(() {});
        return a;
      },
      child: MaterialApp(
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
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
                  fontFamily: "Times New Roman",
                  fontWeight: FontWeight.w600,
                  color: Colors.pink.shade900,
                  fontSize: MediaQuery.of(context).textScaleFactor * 12,
                ),
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
                    text: LocaleKeys.homepage.tr(),
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
            actions: [
              IconButton(
                  onPressed: () => {context.setLocale(AppConstant.TR_LOCALE)},
                  icon: Image(
                    image: AssetImage('assets/img/turkish.png'),
                  )),
              IconButton(
                  onPressed: () => {context.setLocale(AppConstant.EN_LOCALE)},
                  icon: Image(
                    image: AssetImage('assets/img/english.png'),
                  )),
            ],
            centerTitle: true,
            backgroundColor: Colors.blue.shade200,
            title: Text(
              "I-PPD",
              style: TextStyle(
                  fontFamily: "Times New Roman",
                  fontWeight: FontWeight.w600,
                  color: Colors.pink.shade900,
                  fontSize: 30),
            ),
          ),
        ),
      ),
    );
  }
}

void onPressed() {}
