//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ippd/home/home.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:ippd/pageview/pageview_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme:ThemeData(brightness:Brightness.dark),
      title: "Ippd",
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splashTransition: SplashTransition.scaleTransition,
        nextScreen: Pageviewing(),
        duration: 3,
        animationDuration: Duration(milliseconds: 1800),
        //centered: true,
        pageTransitionType: PageTransitionType.leftToRight,
        backgroundColor: Color.fromARGB(255, 219, 239, 236),
        curve: Curves.easeOutBack,
        splashIconSize: 650,
        splash:
            Image(fit: BoxFit.fill, image: AssetImage('assets/img/ippd2.png')),
      ),
    );
  }
}
