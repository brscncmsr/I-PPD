import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_button/group_button.dart';
import 'package:ippd/language.dart';
import 'package:ippd/localekeys.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class BmI extends StatefulWidget {
  BmI({Key? key}) : super(key: key);

  @override
  _BmIState createState() => _BmIState();
}

bool _isInitialValue = true;

final TextEditingController _heightController = TextEditingController();
final TextEditingController _weightController = TextEditingController();
final TextEditingController _bellyController = TextEditingController();
final TextEditingController _ageController = TextEditingController();
double _result = 0.0;
int select = 0;
double _fontsize = 14;
String _textR = "";
String _img = "assets/img/MBMI-0.png";
String _imgn = "assets/img/nurse3.png";
String sugges1 = "";
String sugges2 = "";
String sugges3 = "";
String? _interest;
bool isobes = false;
bool isrisky = false;
bool checkbelly = false;
Color _colortext = Colors.pink.shade900;
User? user = FirebaseAuth.instance.currentUser;
dynamic data;
bool _isSelected = false;

class _BmIState extends State<BmI> {
  void initState() {
    super.initState();
    getData();

    // Or call your function here
  }

  @override
  Widget build(BuildContext context) {
    final snackbar1 = SnackBar(
      content: Text("Lütfen Bütün Bilgileri Eksiksiz Giriniz"),
      action: SnackBarAction(
        label: 'Tamam',
        onPressed: () {},
      ),
    );

    return MaterialApp(
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
                leading: BackButton(
                  onPressed: () => {Navigator.pop(context)},
                ),
                backgroundColor: Colors.blue.shade300,
                title: Text('Vücut Kitle Endeksi',
                    style: TextStyle(
                        fontFamily: "Times New Roman",
                        fontWeight: FontWeight.bold,
                        color: Colors.pink.shade900))),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.all(10.0)),
                    SizedBox(
                      width: 300,
                      child: TextField(
                        maxLength: 3,
                        controller: _heightController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          counterText: '',
                          helperText: 'Örneğin 160 olarak girebilirsiniz',
                          helperStyle: TextStyle(fontFamily: "Times New Roman"),
                          icon: IconButton(
                            icon: Container(
                                width:
                                    MediaQuery.of(context).size.height * 0.06,
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                child: Image(
                                    fit: BoxFit.fill,
                                    image:
                                        AssetImage('assets/img/height.png'))),
                            onPressed: () => heigthalert(context),
                          ),
                          labelText: LocaleKeys.bmiheight.tr(),
                          labelStyle: TextStyle(fontFamily: "Times New Roman"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(10.0)),
                    SizedBox(height: 20),
                    SizedBox(
                      width: 300,
                      child: TextField(
                        maxLength: 3,
                        controller: _weightController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          counterText: '',
                          helperText: 'Örneğin 80 olarak girebilirsiniz',
                          helperStyle: TextStyle(fontFamily: "Times New Roman"),
                          icon: IconButton(
                            icon: Container(
                                width:
                                    MediaQuery.of(context).size.height * 0.06,
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                child: Image(
                                    fit: BoxFit.fill,
                                    image:
                                        AssetImage('assets/img/weight.png'))),
                            onPressed: () => weightalert(context),
                          ),
                          labelText: 'Kilo kg cinsinden',
                          labelStyle: TextStyle(fontFamily: "Times New Roman"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(10.0)),
                    SizedBox(height: 20),
                    SizedBox(
                      width: 300,
                      child: TextField(
                        maxLength: 3,
                        controller: _bellyController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          counterText: '',
                          helperText: 'Örneğin 40 olarak girebilirsiniz',
                          helperStyle: TextStyle(fontFamily: "Times New Roman"),
                          icon: IconButton(
                            icon: Container(
                                width:
                                    MediaQuery.of(context).size.height * 0.06,
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                child: Image(
                                    fit: BoxFit.fill,
                                    image: AssetImage('assets/img/bel.png'))),
                            onPressed: () => bellyalert(context),
                          ),
                          labelText: 'Bel cm cinsinden',
                          labelStyle: TextStyle(fontFamily: "Times New Roman"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(10.0)),
                    SizedBox(height: 20),
                    SizedBox(
                      width: 300,
                      child: TextField(
                        maxLength: 2,
                        controller: _ageController,
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                          counterText: '',
                          helperText: 'Elle Bu Alana Yazabilirsiniz',
                          helperStyle: TextStyle(fontFamily: "Times New Roman"),
                          icon: IconButton(
                            icon: Container(
                                width:
                                    MediaQuery.of(context).size.height * 0.05,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                child: Image(
                                    fit: BoxFit.fill,
                                    image: AssetImage('assets/img/age.png'))),
                            onPressed: () => showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: new DateTime(1970),
                              lastDate: new DateTime(2022),
                            ),
                          ),
                          labelText:
                              'Doğum Tarihinizi Soldaki \nButona Basarak Seçebilirsiniz',
                          labelStyle: TextStyle(
                              fontFamily: "Times New Roman", fontSize: 14),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(10.0)),
                    SizedBox(height: 20),
                    Center(
                        child: Text(
                            "Doğru ölçüm yapmak için ilgili ölçümün solundaki sembole tıklayarak adımları izleyebilirsiniz",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).textScaleFactor * 12,
                                fontFamily: "Times New Roman",
                                fontWeight: FontWeight.normal,
                                color: Colors.black))),
                    SizedBox(height: 20),
                    DropdownButton<String>(
                      elevation: 8,
                      style: TextStyle(color: Colors.black87, fontSize: 16),
                      icon: Icon(Icons.arrow_drop_down_circle),
                      iconEnabledColor: Colors.blue,
                      hint: _isSelected
                          ? Text(
                              "$_interest",
                              style: TextStyle(
                                  fontFamily: "Times New Roman",
                                  color: Colors.black),
                            )
                          : Text(
                              " Cinsiyetiniz ?",
                              style: TextStyle(
                                  fontFamily: "Times New Roman",
                                  color: Colors.black),
                            ),
                      items: <String>["Kadın", "Erkek"]
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _interest = newValue!;
                          _isSelected = true;
                        });
                      },
                    ),
                    FlatButton(
                      color: Colors.blue.shade300,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            width: 3,
                            color: Colors.blue,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Text(
                        "Bilgileri Getir",
                        style: TextStyle(
                            fontFamily: "Times New Roman",
                            color: Colors.pink.shade900,
                            fontWeight: FontWeight.bold,
                            fontSize:
                                MediaQuery.of(context).textScaleFactor * 14),
                      ),
                      onPressed: () => {calculateBMIfP()},
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 10),
                        FlatButton(
                          color: Colors.blue.shade300,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 3,
                                color: Colors.blue,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Text(
                            "Hesapla",
                            style: TextStyle(
                                fontFamily: "Times New Roman",
                                color: Colors.pink.shade900,
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).textScaleFactor *
                                        14),
                          ),
                          onPressed: () => {
                            if (_ageController.text == "" ||
                                _heightController.text == "" ||
                                _weightController.text == "" ||
                                _bellyController.text == "")
                              {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackbar1)
                              }
                            else
                              {calculateBMI()}
                          },
                        ),
                        SizedBox(width: 10),
                        FlatButton(
                          color: Colors.blue.shade300,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 3,
                                color: Colors.blue,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Text(
                            "Temizle",
                            style: TextStyle(
                                fontFamily: "Times New Roman",
                                color: Colors.pink.shade900,
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).textScaleFactor *
                                        14),
                          ),
                          onPressed: _clear,
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            sugges3,
                            style: TextStyle(
                              fontFamily: "Times New Roman",
                              color: Colors.blue.shade200,
                              fontSize: _fontsize,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Image(image: AssetImage(_imgn))
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: MediaQuery.of(context).size.height * 0.3,
                          child: Image(image: AssetImage(_img)),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            Text(
                              _result == null ? "Değeri Gir" : _textR,
                              style: TextStyle(
                                fontFamily: "Times New Roman",
                                color: _colortext,
                                fontSize: 19.4,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            AnimatedContainer(
                              duration: Duration(milliseconds: 500),
                              width: _isInitialValue
                                  ? MediaQuery.of(context).size.width * 0.4
                                  : MediaQuery.of(context).size.width * 0.3,
                              height: _isInitialValue
                                  ? MediaQuery.of(context).size.width * 0.4
                                  : MediaQuery.of(context).size.width * 0.4,
                              child: Text(
                                sugges1,
                                style: TextStyle(
                                  fontFamily: "Times New Roman",
                                  color: _colortext,
                                  fontSize: 15.4,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            AnimatedContainer(
                              duration: Duration(milliseconds: 500),
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: MediaQuery.of(context).size.height * 0.2,
                              child: Text(
                                sugges2,
                                style: TextStyle(
                                  fontFamily: "Times New Roman",
                                  color: _colortext,
                                  fontSize: 15.4,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            )));
  }

  void _clear() {
    setState(() {
      _weightController.clear();
      _heightController.clear();
      _ageController.clear();
      _bellyController.clear();
    });
  }

  void calculateBMI() {
    double height = double.parse(_heightController.text) / 100;
    double weight = double.parse(_weightController.text);
    double belly = double.parse(_bellyController.text);
    double age = double.parse(_ageController.text);
    String gender = _interest.toString();
    showResult(height, weight, belly, age, gender);
    setState(() {});
  }

  void calculateBMIfP() {
    double height = double.parse(data["boy"].toString()) / 100;
    double weight = double.parse(data["kilo"].toString());
    double belly = double.parse(data["bel"].toString());
    double age = double.parse(data["yas"].toString());
    String gender = data["cinsiyet"];
    showResult(height, weight, belly, age, gender);
    setState(() {});
  }

  void showResult(
      double height, double weight, double belly, double age, String gender) {
    double heightSquare = height * height;
    double result = weight / heightSquare;

    _result = result;
    if (result < 18.5) {
      _textR = "Zayıf";
      _img = "assets/img/MBMI-1.png";
      isobes = false;
      isrisky = true;
      checkbelly = true;
      _colortext = Colors.green.shade300;
    } else if (result >= 18.5 && result <= 24.9) {
      _textR = "Normal";
      _img = "assets/img/MBMI-2.png";
      isrisky = true;
      checkbelly = true;
      _colortext = Colors.green.shade500;
    } else if (result >= 25 && result <= 29.9) {
      _textR = "Fazla Kilolu";
      _img = "assets/img/MBMI-3.png";
      isrisky = true;
      checkbelly = true;
      _colortext = Colors.orange.shade500;
    } else if (result >= 30 && result <= 34.9) {
      _textR = "Obez";
      _img = "assets/img/MBMI-4.png";
      isobes = true;
      isrisky = false;
      checkbelly = true;
      _colortext = Colors.orange.shade800;
    } else if (result >= 35 && result <= 39.9) {
      _textR = "Ağır Obez";
      _img = "assets/img/MBMI-5.png";
      isobes = true;
      isrisky = false;
      checkbelly = false;
      _colortext = Colors.red.shade600;
    } else if (result >= 40) {
      _textR = "Aşırı Obez";
      _img = "assets/img/MBMI-6.png";
      isobes = true;
      isrisky = false;
      checkbelly = false;
      _colortext = Colors.red.shade900;
    }

    if (isobes) {
      if (result < 18.5) {
        sugges1 =
            "Beslenme durumunuzun değerlendirilmesi için diyetisyene danışınız.";
        sugges2 = "";
      }
      if (result >= 30 && result <= 39.9) {
        _imgn = "assets/img/nurse2.png";
        sugges1 =
            "Beslenme durumunuzun değerlendirilmesi için diyetisyene danışınız.";
        sugges2 =
            "Fiziksel aktivite için uygulamamızda bulunan yaşınıza uygun egzersiz planlarına erişim sağlayabilirsiniz.";
        sugges3 = "İnancını Değil Kilonu Kaybet";
        _fontsize = 14;
      }
      if (result >= 40) {
        _imgn = "assets/img/nurse2.png";
        sugges1 =
            "Beslenme durumunuzun değerlendirilmesi için diyetisyene danışınız.";
        sugges2 =
            "Fiziksel aktivite için uygulamamızda bulunan yaşınıza uygun egzersiz planlarına erişim sağlayabilirsiniz.";
        sugges3 =
            "Endokrinoloji uzmanına danışınız.\nEn yakın sağlık kurumuna gidiniz.";
        _fontsize = 12;
      }
    }
    if (isrisky) {
      sugges3 = "";
      _imgn = "assets/img/nurse3.png";
      if (age >= 19 && age < 30 && gender == "Kadın") {
        sugges1 =
            "Obezite riskiniz cinsiyetiniz ve yaşınız baz alındığında %41 oranındadır.";
        sugges2 =
            "Daha sağlıklı ve kaliteli bir yaşam için uygulamamızda bulunan yaşınıza uygun egzersiz planlarını kontrol edebilirsiniz.";
      } else if (age >= 19 && age < 30 && gender == "Erkek") {
        sugges1 =
            "Obezite riskiniz cinsiyetiniz ve yaşınız baz alındığında %20.5 oranındadır.";
        sugges2 =
            "Daha sağlıklı ve kaliteli bir yaşam için uygulamamızda bulunan yaşınıza uygun egzersiz planlarını kontrol edebilirsiniz.";
      } else if (age >= 30 && gender == "Kadın") {
        sugges1 =
            "Obezite riskiniz cinsiyetiniz ve yaşınız baz alındığında %20.5 oranından fazladır.";
        sugges2 =
            "Daha sağlıklı ve kaliteli bir yaşam için uygulamamızda bulunan yaşınıza uygun egzersiz planlarını kontrol edebilirsiniz.";
      } else if (age >= 30 && gender == "Erkek") {
        sugges1 =
            "Obezite riskiniz cinsiyetiniz ve yaşınız baz alındığında %41 oranından fazladır.";
        sugges2 =
            "Daha sağlıklı ve kaliteli bir yaşam için uygulamamızda bulunan yaşınıza uygun egzersiz planlarını kontrol edebilirsiniz.";
      }
    }
    if (checkbelly) {
      if (belly > 100 && gender == "Erkek") {
        sugges1 =
            "Beslenme durumunuzun değerlendirilmesi için diyetisyene danışınız.";
        sugges2 =
            "Fiziksel aktivite için uygulamamızda bulunan yaşınıza uygun egzersiz planlarına erişim sağlayabilirsiniz.";
      } else if (belly > 90 && gender == "Kadın") {
        sugges1 =
            "Beslenme durumunuzun değerlendirilmesi için diyetisyene danışınız.";
        sugges2 =
            "Fiziksel aktivite için uygulamamızda bulunan yaşınıza uygun egzersiz planlarına erişim sağlayabilirsiniz.";
      }
    }
    setState(() {});
    //FirebaseFirestore.instance.collection("bmi").doc(user!.uid).set(
    //  {"result": _result, "yas": _ageController.text, "userid": user!.uid});
  }

  Future<dynamic> getData() async {
    final DocumentReference document =
        FirebaseFirestore.instance.collection("users").doc(user!.uid);

    await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
      setState(() {
        data = snapshot.data();
      });
    });
  }

  heigthalert(context) {
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
      title: "Boyumu Nasıl Ölçerim ?",
      context: context,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              margin: EdgeInsets.fromLTRB(5, 25, 5, 10),
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 1,
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
                              "Duvarın yanında düz, beton, fayans veya ahşap vb.gibi yükselti yapmayan bir zemin üzerinde bulunun.\nHalı veya kilim bulunan zeminlerden kaçının.\nAyağınızda çorap, terlik ve ayakkabı varsa çıkarın.\nBaşınızdaki her şeyi çıkarın. Şapka, saç bandı takma veya at kuyruğun varsa bozun. Saçınızı düz bırakın.\nSırtınızı duvara yaslayın ve ayaklarınızı birleştirin. Topuklarınızı, sırtınızı, omuzlarınızı ve başınızı duvara yaslayarak olabildiğince dik durun. Çenenizi geride tutun ve düz bir şekilde ileri bakın.\nBoyunuzu ölçmek için başka birinden yardım alarak başınızın tam üzerinden kalem ile duvara çizgi çekmesini sağlayabilirsiniz ya da kendi boyunuzu kendiniz ölçmek için bir kutu ve aynadan yardım alabilirsiniz.\nKutuyu bir elinizde, ayna ve kalemi diğer elinizde tutun.\nKüçük kutuyu başının üzerine kaldırın ve duvara bastırın.\nAynayı kullanarak kutunun zemine paralel ve duvara dik olduğundan emin olarak bir dik açı oluşturun.\nKutuyu eğmeyin çünkü bu, ölçümün yanlış olmasına neden olur.\nKutunun alt kısmının durduğu yeri duvara işaretle.\nEğer mümkünse kutuyu sabit tut ve kendini kaydırarak kutunun altından çık.\nMezurayı duvara yasla zeminden kalem işaretine kadar ölç.",
                              style: TextStyle(
                                  fontFamily: "Times New Roman",
                                  fontSize:
                                      MediaQuery.of(context).textScaleFactor *
                                          12,
                                  fontWeight: FontWeight.bold),
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

  weightalert(context) {
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
      title: "Kilomu Nasıl Ölçerim ?",
      context: context,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              margin: EdgeInsets.fromLTRB(5, 25, 5, 10),
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 1,
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
                            margin: EdgeInsets.all(20),
                            child: Text(
                              "Tartılma işleminin sabah aç karnına, mümkün olan en hafif giysilerle, tuvalet\nsonrası yapılması, ölçüm esnasında dik ve hareket etmeden durulması gerekir.\nAyrıca zeminin sert ve düz olacak şekilde ayarlanmış olması doğru sonuç almak için\noldukça önemlidir.",
                              style: TextStyle(
                                  fontFamily: "Times New Roman",
                                  fontSize:
                                      MediaQuery.of(context).textScaleFactor *
                                          20,
                                  fontWeight: FontWeight.bold),
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

  bellyalert(context) {
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
      title: "Bel Çevremi Nasıl Ölçerim ?",
      context: context,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              margin: EdgeInsets.fromLTRB(5, 25, 5, 10),
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 1,
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
                              "Öncelikle doğru bir ölçüm elde etmek için, ölçülen kısımdan kıyafet kaldırılır,\nBel bölgesinin doğru biçimde belirlenmesi için, Kalça kemiklerinin üst kısmını ve\ngöğüs kafesinin alt kısmını referans alabilirsiniz. Beliniz, bu iki kemikli parça\narasındaki yumuşak, etli kısımdır\nMezurayı belinize sarın. Ayağa kalkın ve normal\nbir şekilde nefes alın, mezuranın bir ucunu göbeğinizde tutun ve belinizin arkasına\ndoğru dolayın. Mezura zemine paralel olmalı ve cildinize bastırmadan vücudunuzun\netrafına rahatça oturmalıdır.\nMezurayı doğru okumak için, mezuranın belinin etrafında tam düz olduğundan ve\n  özellikle arka kısımda bükülmediğinden emin olun. Nefes verin ve sonra mezura\nüzerindeki ölçümü kontrol edin.",
                              style: TextStyle(
                                  fontFamily: "Times New Roman",
                                  fontSize:
                                      MediaQuery.of(context).textScaleFactor *
                                          14,
                                  fontWeight: FontWeight.bold),
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
}
