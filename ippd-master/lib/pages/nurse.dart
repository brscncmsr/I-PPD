import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ippd/pages/contactnurse.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Nurse extends StatefulWidget {
  Nurse({Key? key}) : super(key: key);

  @override
  _NurseState createState() => _NurseState();
}

class _NurseState extends State<Nurse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IPPD Hemşirelerinden Tavsiyeler'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade200,
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                    "Merhabalar Ben Asistan Hemşireniz \n Size Nasıl Yardımcı Olabilirim ?",
                    style: GoogleFonts.patrickHand(
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),
                Image(image: AssetImage("assets/img/nurse2.png"))
              ]),
              FlatButton(
                  color: Colors.grey.shade500,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        width: 3,
                        color: Colors.grey.shade700,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  onPressed: () => _dialogalert1(context),
                  child: Row(
                    children: [
                      Text("Yeterli Ve Dengeli Beslenme Önerileri",
                          style: GoogleFonts.patrickHand(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14)),
                    ],
                  )),
              FlatButton(
                  color: Colors.grey.shade500,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        width: 3,
                        color: Colors.grey.shade700,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  onPressed: () => _dialogalert3(context),
                  child: Row(
                    children: [
                      Text(
                          "Aileler ve Toplum için Ergenlikte Obeziteden Korunmayı Sağlayan İpuçları",
                          style: GoogleFonts.patrickHand(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12)),
                    ],
                  )),
              FlatButton(
                  color: Colors.grey.shade500,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        width: 3,
                        color: Colors.grey.shade700,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  onPressed: () => _dialogalert2(context),
                  child: Row(
                    children: [
                      Center(
                        child: Text(
                            "Fazla Kilolu ve Obez Bireyler İçin Sağlıklı Beslenme Önerileri",
                            style: GoogleFonts.patrickHand(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14)),
                      )
                    ],
                  )),
              FlatButton(
                  color: Colors.grey.shade500,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        width: 3,
                        color: Colors.grey.shade700,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  onPressed: () => _dialogalert4(context),
                  child: Row(
                    children: [
                      Text(
                          "Obeziteden Kurtulmak İçin Hangi Düşüncelerden Uzak Durmalıyım ?",
                          style: GoogleFonts.patrickHand(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14)),
                    ],
                  )),
              FlatButton(
                  color: Colors.grey.shade500,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        width: 3,
                        color: Colors.grey.shade700,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  onPressed: () => _dialogalert5(context),
                  child: Row(
                    children: [
                      Text(
                          "Obezim! Diyetisyenden destek almaz beslenmeme dikkat etmez\negzersiz planıma uymazsam hangi hastalıklar için riskli durumdayım?",
                          style: GoogleFonts.patrickHand(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12)),
                    ],
                  )),
              FlatButton(
                  color: Colors.grey.shade500,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        width: 3,
                        color: Colors.grey.shade700,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  onPressed: () => Navigator.push(
                      context,
                      PageTransition(
                          child: ContactNurse(),
                          type: PageTransitionType.bottomToTop)),
                  child: Row(
                    children: [
                      Center(
                        child: Text("Hemşilere Ulaşın",
                            style: GoogleFonts.patrickHand(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14)),
                      )
                    ],
                  ))
            ],
          )),
    );
  }
}

void onPressed() {}

_dialogalert1(context) {
  Alert(
    onWillPopActive: true,
    closeIcon: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 3, color: Colors.red),
        ),
        padding: EdgeInsets.all(2),
        child: Icon(Icons.close_outlined, size: 25, color: Colors.red)),
    style: AlertStyle(
      isButtonVisible: false,
      backgroundColor: Colors.blue.shade200,
      alertElevation: 10,
      alertPadding: EdgeInsets.all(10),
      overlayColor: Colors.white, //blue.shade100,
      animationType: AnimationType.shrink,
      animationDuration: Duration(milliseconds: 600),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        side: BorderSide(
          color: Colors.blue.shade300,
          width: 3,
        ),
      ),
    ),
    title: "IPPD Hemşirelerinden Tavsiyeler",
    context: context,
    content: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
            margin: EdgeInsets.fromLTRB(5, 25, 5, 10),
            width: MediaQuery.of(context).size.height * 0.60,
            height: MediaQuery.of(context).size.height * 1,
            child: Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                    width: 3,
                    color: Colors.blue.shade300,
                    style: BorderStyle.solid),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              color: Colors.blue.shade100,
              shadowColor: Colors.black,
              child: Padding(
                //padding:  EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                padding: EdgeInsets.symmetric(horizontal: 0),
                child: Container(
                  margin: EdgeInsets.fromLTRB(25, 25, 25, 10),
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.all(5),
                          child: Text(
                            "Yeterli ve Dengeli Beslenme Önerileri",
                            style: GoogleFonts.patrickHand(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          child: Text(
                            " Yeterli ve dengeli beslenme için 5 temel besin grubunda yer alan besinler, her bireye özgü miktarlarda tüketilmelidir. Temel besin grupları:\nA. Süt ve ürünleri\nB. Et, et ürünleri, yumurta, kuru baklagiller ve yağlı tohumlar\nC. Sebze\nD. Meyve\nE. Ekmek ve diğer tahıl ürünleridir.",
                            style: GoogleFonts.patrickHand(
                                fontSize: 18, fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )),
      ],
    ),
  ).show();
}

_dialogalert2(context) {
  Alert(
    onWillPopActive: true,
    closeIcon: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 3, color: Colors.red),
        ),
        padding: EdgeInsets.all(2),
        child: Icon(Icons.close_outlined, size: 25, color: Colors.red)),
    style: AlertStyle(
      isButtonVisible: false,
      backgroundColor: Colors.blue.shade200,
      alertElevation: 10,
      alertPadding: EdgeInsets.all(10),
      overlayColor: Colors.blue.shade100,
      animationType: AnimationType.shrink,
      animationDuration: Duration(milliseconds: 600),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        side: BorderSide(
          color: Colors.blue.shade300,
          width: 3,
        ),
      ),
    ),
    title: "IPPD Hemşirelerinden Tavsiyeler",
    context: context,
    content: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
            margin: EdgeInsets.fromLTRB(5, 25, 5, 10),
            width: MediaQuery.of(context).size.height * 0.60,
            height: MediaQuery.of(context).size.height * 1,
            child: Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                    width: 3,
                    color: Colors.blue.shade300,
                    style: BorderStyle.solid),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              color: Colors.blue.shade100,
              shadowColor: Colors.black,
              child: Padding(
                //padding:  EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                padding: EdgeInsets.symmetric(horizontal: 0),
                child: Container(
                  margin: EdgeInsets.fromLTRB(25, 25, 25, 10),
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.all(5),
                          child: Text(
                            "Fazla Kilolu ve Obez Bireyler İçin Sağlıklı Beslenme Önerileri",
                            style: GoogleFonts.patrickHand(
                                fontSize: 21, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          child: Text(
                            "Yağ ve/veya şeker miktarı azaltılmış (diyet/light) ürünler, her zaman düşük enerji içermez. Bu ürünlerin tüketiminde dikkatli olunmalıdır.\nHazır meyve suları, gazlı içecekler vb. yerine sağlıklı içecekler tercih edilmelidir.\nKızartma yerine ızgara, haşlama, buharda ve fırında pişirme yöntemleri seçilmelidir. \nGün boyu aktif olunmalıdır.\nHızlı vücut ağırlık kaybına neden olan popüler diyetler ve kontrolsüz zayıflama ilaçları kesinlikle uygulanmamalıdır.",
                            style: GoogleFonts.patrickHand(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )),
      ],
    ),
  ).show();
}

_dialogalert3(context) {
  Alert(
    onWillPopActive: true,
    closeIcon: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 3, color: Colors.red),
        ),
        padding: EdgeInsets.all(2),
        child: Icon(Icons.close_outlined, size: 25, color: Colors.red)),
    style: AlertStyle(
      isButtonVisible: false,
      backgroundColor: Colors.blue.shade200,
      alertElevation: 10,
      alertPadding: EdgeInsets.all(10),
      overlayColor: Colors.blue.shade100,
      animationType: AnimationType.shrink,
      animationDuration: Duration(milliseconds: 600),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        side: BorderSide(
          color: Colors.blue.shade300,
          width: 3,
        ),
      ),
    ),
    title: "IPPD Hemşirelerinden Tavsiyeler",
    context: context,
    content: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
            margin: EdgeInsets.fromLTRB(5, 25, 5, 10),
            width: MediaQuery.of(context).size.height * 0.60,
            height: MediaQuery.of(context).size.height * 1,
            child: Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                    width: 3,
                    color: Colors.blue.shade300,
                    style: BorderStyle.solid),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              color: Colors.blue.shade100,
              shadowColor: Colors.black,
              child: Padding(
                //padding:  EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                padding: EdgeInsets.symmetric(horizontal: 0),
                child: Container(
                  margin: EdgeInsets.fromLTRB(25, 25, 25, 10),
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.all(5),
                          child: Text(
                            "Aileler ve Toplum için \NErgenlikte Obeziteden Korunmayı Sağlayan İpuçları",
                            style: GoogleFonts.patrickHand(
                                fontSize: 21, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          child: Text(
                            " 1. Evde fast-food ve şekerli içecekler kısıtlanmalıdır (Yemek yeme modifikasyonu).\n2. TV, sinema ve video oyunları : Günde 2 saatin altına indirilmelidir.\n3. Çocukların günlük ev işlerini yapmasına izin verilmelidir.\n4. Güvenli olan ve mümkün olan her şartta yürüyüş tercih edilmelidir.\n5. Okul beden eğitimi ve beslenme programları desteklenmelidir.\n6. Okul spor oyunlarına çocuğun katılımı cesaretlendirilmeli ve destek￾lenmelidir.\n7. Çocuklar ev ödevinden önce, okuldan sonra dışarıda aktif bir işe cesaretlendirilmelidir.\n8. Şehir rekreasyonel olanaklarını araştırılmalıdır.\n9. Fitnes içerikli hediyeleri seçilmelidir (paten, ip atlama, bisiklet).\n10. Tatil veya dışarıda aile ile birlikte plan yapılmalıdır.",
                            style: GoogleFonts.patrickHand(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )),
      ],
    ),
  ).show();
}

_dialogalert4(context) {
  Alert(
    onWillPopActive: true,
    closeIcon: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 3, color: Colors.red),
        ),
        padding: EdgeInsets.all(2),
        child: Icon(Icons.close_outlined, size: 25, color: Colors.red)),
    style: AlertStyle(
      isButtonVisible: false,
      backgroundColor: Colors.blue.shade200,
      alertElevation: 10,
      alertPadding: EdgeInsets.all(10),
      overlayColor: Colors.blue.shade100,
      animationType: AnimationType.shrink,
      animationDuration: Duration(milliseconds: 600),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        side: BorderSide(
          color: Colors.blue.shade300,
          width: 3,
        ),
      ),
    ),
    title: "IPPD Hemşirelerinden Tavsiyeler",
    context: context,
    content: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
            margin: EdgeInsets.fromLTRB(5, 25, 5, 10),
            width: MediaQuery.of(context).size.height * 0.60,
            height: MediaQuery.of(context).size.height * 1,
            child: Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                    width: 3,
                    color: Colors.blue.shade300,
                    style: BorderStyle.solid),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              color: Colors.blue.shade100,
              shadowColor: Colors.black,
              child: Padding(
                //padding:  EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                padding: EdgeInsets.symmetric(horizontal: 0),
                child: Container(
                  margin: EdgeInsets.fromLTRB(25, 25, 25, 10),
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.all(5),
                          child: Text(
                            "Obeziteden Kurtulmak İçin \nHangi Düşüncelerden Uzak Durmalıyım ?",
                            style: GoogleFonts.patrickHand(
                                fontSize: 21, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          child: Text(
                            " 1.) Ya Hep Ya Hiç : Örneğin - Ya diyete bütün kuralları ile uymalıyım ya da en ufak bir kaçamakta diyeti tümüyle bırakabilirim.\nBu tarz düşünme biçimi hem kilo sorununun sürmesine hem de kilo vermeye yönelik davranışların engellenmesine yol açabilir\n2.) Olumluyu Azımsama : Örneğin - Sadece 3 kilo verdim o kadar çaba hiçbir işe yaramadı.\nBu tarz düşünme biçimi elde edinilmiş kazanımların önemsenmemesine yol açabilir; diyete ve fiziksel aktivite programlarına uyumu bozabilir.\n3.) Mutlak Kurallar Koymak : Örneğin - Diyet süresince ağzıma hiç tatlı sokmamalıyım, günde en az 5 km yol yürümeliyim.\nUlaşılması güç hedefler koymaya neden olabilir ve nihayetinde bu hedeflere ulaşamamanın getirdiği hayal kırıklarına yol açabilir.\n4.) Aşırı Genelleme : Örneğin - Hiçbir zaman kilo vermeyi başaramayacağım, şimdiye kadar bu kaçıncı denemem.\nKişide olumsuz duygular yaratarak diyet ve fiziksel aktivite programlarına uyumu zorlaştırır.\n5.) Etiketleme: Örneğin - Çok şişmanım, işe yaramaz birisiyim, iradesizin tekiyim.\nKişide olumsuz duygular yaratarak diyet ve fiziksel aktivite programlarına uyumu zorlaştırır.",
                            style: GoogleFonts.patrickHand(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )),
      ],
    ),
  ).show();
}

_dialogalert5(context) {
  Alert(
    onWillPopActive: true,
    closeIcon: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 3, color: Colors.red),
        ),
        padding: EdgeInsets.all(2),
        child: Icon(Icons.close_outlined, size: 25, color: Colors.red)),
    style: AlertStyle(
      isButtonVisible: false,
      backgroundColor: Colors.blue.shade200,
      alertElevation: 10,
      alertPadding: EdgeInsets.all(10),
      overlayColor: Colors.blue.shade100,
      animationType: AnimationType.shrink,
      animationDuration: Duration(milliseconds: 600),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        side: BorderSide(
          color: Colors.blue.shade300,
          width: 3,
        ),
      ),
    ),
    title: "IPPD Hemşirelerinden Tavsiyeler",
    context: context,
    content: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
            margin: EdgeInsets.fromLTRB(5, 25, 5, 10),
            width: MediaQuery.of(context).size.height * 0.60,
            height: MediaQuery.of(context).size.height * 1,
            child: Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                    width: 3,
                    color: Colors.blue.shade300,
                    style: BorderStyle.solid),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              color: Colors.blue.shade100,
              shadowColor: Colors.black,
              child: Padding(
                //padding:  EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                padding: EdgeInsets.symmetric(horizontal: 0),
                child: Container(
                  margin: EdgeInsets.fromLTRB(25, 25, 25, 10),
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.all(5),
                          child: Text(
                            "Hangi Hastalıklar İçin Riskli Durumdayım?",
                            style: GoogleFonts.patrickHand(
                                fontSize: 21, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          child: Text(
                            " -İnsulin Direnci-Hiperinsülinemi\n-Tip 2 Diabetes Mellitus(Şeker Hastalığı)\n-Hipertansiyon(Yüksek Tansiyon)\n-Koroner Arter Hastalığı\n-Hiperlipidemi-Hipertrigliseridemi(Kan Yağlarının Yükselmesi)\n-Metabolik Sendrom\n-Safra Kesesi Hastalıkları\n-Bazı Kanser Türleri\n-Ostreoartrit\n-Felç\n-Uyku Apnesi\n-Karaciğer Yağlanması\n-Astım\n-Solunum Zorluğu\n-Gebelik Komplikasyonları\n-Menstruasyon Düzensizlikleri\n-Aşırı Kıllanma\n-Ameliyat Risklerini Artması\n-Ruhsal Sorunlar\n-Toplumsal Uyumsuzluklar\n-Kas-İskelet Problemleri",
                            style: GoogleFonts.patrickHand(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )),
      ],
    ),
  ).show();
}
