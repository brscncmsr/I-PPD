import 'package:flutter/material.dart';
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
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(20),
                height: 80,
                color: Colors.green.shade500,
                child: FlatButton(
                    onPressed: () => _dialogalert1(context),
                    child: Row(
                      children: [
                        Text("Yeterli Ve Dengeli Beslenme Önerileri"),
                      ],
                    )),
              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(20),
                height: 90,
                color: Colors.blue.shade400,
                child: FlatButton(
                    onPressed: () => _dialogalert3(context),
                    child: Row(
                      children: [
                        Text(
                            "Aileler ve Toplum için \nErgenlikte Obeziteden Korunmayı \nSağlayan İpuçları"),
                      ],
                    )),
              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(20),
                height: 80,
                color: Colors.orange.shade500,
                child: FlatButton(
                    onPressed: () => _dialogalert2(context),
                    child: Row(
                      children: [
                        Text(
                            "Fazla Kilolu ve Obez Bireyler İçin \nSağlıklı Beslenme Önerileri"),
                      ],
                    )),
              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(20),
                height: 80,
                color: Colors.red.shade300,
                child: FlatButton(
                    onPressed: () => _dialogalert4(context),
                    child: Row(
                      children: [
                        Text(
                            "Obeziteden Kurtulmak İçin \nHangi Düşüncelerden Uzak Durmalıyım ?"),
                      ],
                    )),
              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(20),
                height: 110,
                color: Colors.red.shade700,
                child: FlatButton(
                    onPressed: () => _dialogalert5(context),
                    child: Row(
                      children: [
                        Text(
                            "Obezim! Diyetisyenden destek almaz \nbeslenmeme dikkat etmez\negzersiz planıma uymazsam \nhangi hastalıklar için riskli durumdayım?"),
                      ],
                    )),
              ),
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
            height: MediaQuery.of(context).size.height * 0.75,
            child: Card(
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
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          child: Text(
                            " Yeterli ve dengeli beslenme için 5 temel besin grubunda yer alan besinler, her bireye özgü miktarlarda tüketilmelidir. Temel besin grupları:\nA. Süt ve ürünleri\nB. Et, et ürünleri, yumurta, kuru baklagiller ve yağlı tohumlar\nC. Sebze\nD. Meyve\nE. Ekmek ve diğer tahıl ürünleridir.",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.normal),
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
            height: MediaQuery.of(context).size.height * 0.75,
            child: Card(
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
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          child: Text(
                            "Yağ ve/veya şeker miktarı azaltılmış (diyet/light) ürünler, her zaman düşük enerji içermez. Bu ürünlerin tüketiminde dikkatli olunmalıdır.\nHazır meyve suları, gazlı içecekler vb. yerine sağlıklı içecekler tercih edilmelidir.\nKızartma yerine ızgara, haşlama, buharda ve fırında pişirme yöntemleri seçilmelidir. \nGün boyu aktif olunmalıdır.\nHızlı vücut ağırlık kaybına neden olan popüler diyetler ve kontrolsüz zayıflama ilaçları kesinlikle uygulanmamalıdır.",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.normal),
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
            height: MediaQuery.of(context).size.height * 0.75,
            child: Card(
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
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          child: Text(
                            " 1. Evde fast-food ve şekerli içecekler kısıtlanmalıdır (Yemek yeme modifikasyonu).\n2. TV, sinema ve video oyunları : Günde 2 saatin altına indirilmelidir.\n3. Çocukların günlük ev işlerini yapmasına izin verilmelidir.\n4. Güvenli olan ve mümkün olan her şartta yürüyüş tercih edilmelidir.\n5. Okul beden eğitimi ve beslenme programları desteklenmelidir.\n6. Okul spor oyunlarına çocuğun katılımı cesaretlendirilmeli ve destek￾lenmelidir.\n7. Çocuklar ev ödevinden önce, okuldan sonra dışarıda aktif bir işe cesaretlendirilmelidir.\n8. Şehir rekreasyonel olanaklarını araştırılmalıdır.\n9. Fitnes içerikli hediyeleri seçilmelidir (paten, ip atlama, bisiklet).\n10. Tatil veya dışarıda aile ile birlikte plan yapılmalıdır.",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.normal),
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
            width: MediaQuery.of(context).size.height * 0.80,
            height: MediaQuery.of(context).size.height * 0.95,
            child: Card(
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
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          child: Text(
                            " 1.) Ya Hep Ya Hiç : Örneğin - Ya diyete bütün kuralları ile uymalıyım ya da en ufak bir kaçamakta diyeti tümüyle bırakabilirim.\nBu tarz düşünme biçimi hem kilo sorununun sürmesine hem de kilo vermeye yönelik davranışların engellenmesine yol açabilir\n2.) Olumluyu Azımsama : Örneğin - Sadece 3 kilo verdim o kadar çaba hiçbir işe yaramadı.\nBu tarz düşünme biçimi elde edinilmiş kazanımların önemsenmemesine yol açabilir; diyete ve fiziksel aktivite programlarına uyumu bozabilir.\n3.) Mutlak Kurallar Koymak : Örneğin - Diyet süresince ağzıma hiç tatlı sokmamalıyım, günde en az 5 km yol yürümeliyim.\nUlaşılması güç hedefler koymaya neden olabilir ve nihayetinde bu hedeflere ulaşamamanın getirdiği hayal kırıklarına yol açabilir.\n4.) Aşırı Genelleme : Örneğin - Hiçbir zaman kilo vermeyi başaramayacağım, şimdiye kadar bu kaçıncı denemem.\nKişide olumsuz duygular yaratarak diyet ve fiziksel aktivite programlarına uyumu zorlaştırır.\n5.) Etiketleme: Örneğin - Çok şişmanım, işe yaramaz birisiyim, iradesizin tekiyim.\nKişide olumsuz duygular yaratarak diyet ve fiziksel aktivite programlarına uyumu zorlaştırır.",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.normal),
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
            height: MediaQuery.of(context).size.height * 0.75,
            child: Card(
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
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          child: Text(
                            " -İnsulin Direnci-Hiperinsülinemi\n-Tip 2 Diabetes Mellitus(Şeker Hastalığı)\n-Hipertansiyon(Yüksek Tansiyon)\n-Koroner Arter Hastalığı\n-Hiperlipidemi-Hipertrigliseridemi(Kan Yağlarının Yükselmesi)\n-Metabolik Sendrom\n-Safra Kesesi Hastalıkları\n-Bazı Kanser Türleri\n-Ostreoartrit\n-Felç\n-Uyku Apnesi\n-Karaciğer Yağlanması\n-Astım\n-Solunum Zorluğu\n-Gebelik Komplikasyonları\n-Menstruasyon Düzensizlikleri\n-Aşırı Kıllanma\n-Ameliyat Risklerini Artması\n-Ruhsal Sorunlar\n-Toplumsal Uyumsuzluklar\n-Kas-İskelet Problemleri",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.normal),
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
