//import 'package:firebase_auth/firebase_auth.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ippd/home/home.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:ippd/language.dart';
import 'package:ippd/localekeys.dart';
import 'package:ippd/pageview/pageview_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool a = false;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  await Firebase.initializeApp();

  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  var sharedPreferences = await SharedPreferences.getInstance();
  if (sharedPreferences.getInt("count") == 1) {
    a = true;
  }
  runApp(EasyLocalization(
      supportedLocales: AppConstant.SUPPORTED_LOCALE,
      path: AppConstant.LANG_PATH,
      fallbackLocale: Locale('tr', 'TR'),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      //theme:ThemeData(brightness:Brightness.dark),
      title: "IPPD",
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splashTransition: SplashTransition.scaleTransition,
        nextScreen: a ? Anasayfa() : Pageviewing(),
        duration: 3,
        animationDuration: Duration(milliseconds: 1800),
        //centered: true,
        pageTransitionType: PageTransitionType.leftToRight,
        backgroundColor: Color.fromARGB(255, 219, 239, 236),
        curve: Curves.easeOutBack,
        splashIconSize: 400,
        splash:
            Image(fit: BoxFit.fill, image: AssetImage('assets/img/ippd2.png')),
      ),
    );
  }
}
