import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ippd/home/home.dart';
import 'package:ippd/login/pages/login_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'slider.dart';
import 'package:get/get.dart';

class Pageviewing extends StatefulWidget {
  @override
  _PageviewingState createState() => _PageviewingState();
}

User? user = FirebaseAuth.instance.currentUser;

class _PageviewingState extends State<Pageviewing> {
  int _currentPage = 0;
  PageController _controller = PageController();
  User? user = FirebaseAuth.instance.currentUser;

  List<Widget> _pages = [
    SliderPage(
        title: "Kim Geliştirdi?",
        description:
            "IPP-D sizi sağlık durumu ve hastalık riskleri hakkında bilgilendirmek amacıyla BAP.ÖOP.004 nolu proje kodu ile geliştirilmiştir ve Hasan Kalyoncu Üniversitesi tarafından desteklenmektedir.",
        image: "assets/img/MBMI-0.png"),
    SliderPage(
        title: "Neden geliştirildi?",
        description:
            " IPP-D uygulaması risk altında bulunduğunuz hastalıkları önlemek, mevcut sağlık düzeyinizi korumak ve geliştirmek amacıyla oluşturulan yapay zeka destekli bir uygulamadır.",
        image: "assets/img/MBMI-0.png"),
    SliderPage(
        title: "Önemli Hatırlatma",
        description:
            " IPP-D uygulamasının doğru sonuçları verebilmesi için istenilen bilgileri, anket formlarını ve gerekli bütün bilgileri doğru girmeniz önem arz etmektedir..",
        image: "assets/img/MBMI-0.png"),
  ];

  _onchanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            scrollDirection: Axis.horizontal,
            onPageChanged: _onchanged,
            controller: _controller,
            itemCount: _pages.length,
            itemBuilder: (context, int index) {
              return _pages[index];
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(_pages.length, (int index) {
                    return AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        height: 10,
                        width: (index == _currentPage) ? 30 : 10,
                        margin:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: (index == _currentPage)
                                ? Colors.blue
                                : Colors.blue.withOpacity(0.5)));
                  })),
              InkWell(
                onTap: () {
                  _controller.nextPage(
                      duration: Duration(milliseconds: 800),
                      curve: Curves.easeInOutQuint);
                },
                child: AnimatedContainer(
                  alignment: Alignment.center,
                  duration: Duration(milliseconds: 300),
                  height: 70,
                  width: (_currentPage == (_pages.length - 1)) ? 200 : 75,
                  decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(35)),
                  child: (_currentPage == (_pages.length - 1))
                      ? FlatButton(
                          onPressed: () => checkSign(),
                          child: Text(
                            "Başla",
                            style: GoogleFonts.patrickHand(
                                color: Colors.white60,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      : Icon(
                          Icons.navigate_next,
                          size: 50,
                          color: Colors.white,
                        ),
                ),
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ],
      ),
    );
  }

  void checkSign() async {
    FirebaseAuth.instance.idTokenChanges().listen((User? user) {
      if (user != null) {
        Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.rightToLeft,
              duration: Duration(milliseconds: 500),
              child: Anasayfa(),
            ));
      } else {
        Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.rightToLeft,
              duration: Duration(milliseconds: 500),
              child: LoginPage(),
            ));
      }
    });

    setState(() {});
  }
}
