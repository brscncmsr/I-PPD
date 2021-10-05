import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ippd/home/home.dart';
import 'package:page_transition/page_transition.dart';
import 'slider.dart';

class Pageviewing extends StatefulWidget {
  @override
  _PageviewingState createState() => _PageviewingState();
}

class _PageviewingState extends State<Pageviewing> {
  int _currentPage = 0;
  PageController _controller = PageController();

  List<Widget> _pages = [
    SliderPage(
        title: "Kim Geliştirdi?",
        description:
            "IPP-D sizi sağlık durumu ve hastalık riskleri hakkında bilgilendirmek amacıyla BAP.ÖOP.004 nolu proje kodu ile geliştirilmiştir ve Hasan Kalyoncu Üniversitesi tarafından desteklenmektedir.",
        image: ""),
    SliderPage(
        title: "Neden geliştirildi?",
        description:
            " IPP-D uygulaması risk altında bulunduğunuz hastalıkları önlemek, mevcut sağlık düzeyinizi korumak ve geliştirmek amacıyla oluşturulan yapay zeka destekli bir uygulamadır.",
        image: ""),
    SliderPage(
        title: "Önemli Hatırlatma",
        description:
            " IPP-D uygulamasının doğru sonuçları verebilmesi için istenilen bilgileri, anket formlarını ve gerekli bütün bilgileri doğru girmeniz önem arz etmektedir..",
        image: ""),
    Column(
      mainAxisAlignment:MainAxisAlignment.center,
      children:
      [
        Container(
          width:250,
          child:
          Text(
            "Giriş Yapabilmeniz için telefon numaranızı girmelisiniz ve ardından gelen sms ile numaranızı doğruladığınızda giriş yapabilirsiniz."
          ,style:GoogleFonts.amaticSc(
                height: 1.5,
                fontWeight: FontWeight.normal,
                fontSize: 18,
                letterSpacing: 0.5,
          )
              ),
        ),
        SizedBox(height:50),
        Container(
          width:250,
          child: TextField(
            autocorrect: true,
            
                                      //controller: emailController,
                                      keyboardType: TextInputType.number,
                                      cursorColor: Colors.amber,
                                      decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.blue,
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.all(Radius.circular(5)),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                ),
                                        suffixIcon: Icon(Icons.phone_rounded),
                                         
                                        //labelStyle: TextStyle(color: Colors.amber),
                                        labelText: 'Telefon',
                                        hintText: 'Telefon numaranızı girin...',
                                        hintStyle: TextStyle(
                                          color: Colors.blue,
                                        ),
                                        
                                      ),
                                    ),
        ),
        SizedBox(height: 140,)
      ],
    )
  ];

  _onchanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                          onPressed: () => Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeft,
                              duration: Duration(milliseconds: 500),
                              child: Anasayfa(),
                            ),
                          ),
                          child: Text(
                            "Başla",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
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
}