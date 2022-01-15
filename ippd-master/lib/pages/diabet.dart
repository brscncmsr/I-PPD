import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_button/group_button.dart';

class DiabetRisk extends StatefulWidget {
  DiabetRisk({Key? key}) : super(key: key);

  @override
  _DiabetRiskState createState() => _DiabetRiskState();
}

User? user = FirebaseAuth.instance.currentUser;
dynamic data;

class _DiabetRiskState extends State<DiabetRisk> {
  @override
  bool _isInitialValue = true;

  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _bellyController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  double _result = 0.0;
  int select = 0;
  int selectq1 = 0;
  int selectq2 = 0;
  int selectq3 = 0;
  int selectq4 = 0;
  int selectq5 = 0;
  int riskpoint = 0;
  double _fontsize = 14;
  String _textR = "";
  String _img = "assets/img/MBMI-0.png";
  String _imgn = "assets/img/nurse3.png";
  String sugges1 = "";
  String sugges2 = "";
  String sugges3 = "";
  String? _interest;
  bool _isSelected = false;

  Future<dynamic> getData() async {
    final DocumentReference document =
        FirebaseFirestore.instance.collection("users").doc(user!.uid);

    await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
      setState(() {
        data = snapshot.data();
      });
    });
  }

  void initState() {
    super.initState();
    getData();

    // Or call your function here
  }

  Color _colortext = Colors.pink.shade900;
  Widget build(BuildContext context) {
    final snackbar1 = SnackBar(
      content: Text("Lütfen Bütün Soruları Cevaplandırın"),
      action: SnackBarAction(
        label: 'Tamam',
        onPressed: () {},
      ),
    );
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            'Diyabet Risk Hesabı',
            style: TextStyle(
                fontFamily: "Times New Roman",
                fontWeight: FontWeight.bold,
                color: Colors.pink.shade900,
                fontSize: MediaQuery.of(context).textScaleFactor * 18),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue.shade200,
        ),
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
                      helperStyle: TextStyle(fontFamily: 'Times New Roman'),
                      icon: Container(
                          width: MediaQuery.of(context).size.height * 0.05,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: Image(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/img/height.png'))),
                      labelText: 'Boy cm cinsinden',
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
                      helperStyle: TextStyle(fontFamily: 'Times New Roman'),
                      icon: Container(
                          width: MediaQuery.of(context).size.height * 0.05,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: Image(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/img/weight.png'))),
                      labelText: 'Kilo kg cinsinden',
                      labelStyle: TextStyle(fontFamily: 'Times New Roman'),
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
                      helperStyle: TextStyle(fontFamily: 'Times New Roman'),
                      icon: Container(
                          width: MediaQuery.of(context).size.height * 0.05,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: Image(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/img/bel.png'))),
                      labelText: 'Bel cm cinsinden',
                      labelStyle: TextStyle(fontFamily: 'Times New Roman'),
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
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      counterText: '',
                      helperText: 'Örneğin 40 olarak girebilirsiniz',
                      helperStyle: TextStyle(fontFamily: 'Times New Roman'),
                      icon: Container(
                          width: MediaQuery.of(context).size.height * 0.05,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: Image(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/img/age.png'))),
                      labelText: 'Yaşınız',
                      labelStyle: TextStyle(fontFamily: 'Times New Roman'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(10.0)),
                SizedBox(height: 20),
                DropdownButton<String>(
                  elevation: 8,
                  style: TextStyle(color: Colors.black87, fontSize: 16),
                  icon: Icon(Icons.arrow_drop_down_circle),
                  iconEnabledColor: Colors.blue,
                  hint: _isSelected
                      ? Text(
                          "$_interest",
                          style: TextStyle(color: Colors.black),
                        )
                      : Text(
                          " Cinsiyetiniz ?",
                          style: TextStyle(color: Colors.black),
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
                Padding(padding: EdgeInsets.all(10.0)),
                SizedBox(height: 20),
                Text(
                  "Genel Olarak Boş Zamanlarınızda Günde En Az 30 dakika yürüyüş yapar mısınız?",
                  style: TextStyle(
                      fontFamily: "Times New Roman",
                      fontWeight: FontWeight.bold,
                      color: Colors.pink.shade900,
                      fontSize: MediaQuery.of(context).textScaleFactor * 16),
                ),
                GroupButton(
                  selectedTextStyle: TextStyle(
                      fontFamily: "Times New Roman",
                      color: Colors.black87,
                      fontWeight: FontWeight.bold),
                  unselectedTextStyle: TextStyle(
                      fontFamily: "Times New Roman", color: Colors.black87),
                  isRadio: true,
                  selectedBorderColor: Colors.blue.shade300,
                  selectedColor: Colors.blue.shade200,
                  unselectedColor: Colors.blue.shade100,
                  unselectedBorderColor: Colors.blue,
                  spacing: 10,
                  buttons: const [
                    'Evet',
                    'Hayır',
                  ],
                  borderRadius: BorderRadius.circular(30),
                  onSelected: (i, selected) => selectq1 = i + 1,
                ),
                Padding(padding: EdgeInsets.all(10.0)),
                SizedBox(height: 20),
                Text(
                  "Hangi Sıklıkla Sebze-Meyve Tüketirsiniz ?",
                  style: TextStyle(
                      fontFamily: "Times New Roman",
                      fontWeight: FontWeight.bold,
                      color: Colors.pink.shade900,
                      fontSize: MediaQuery.of(context).textScaleFactor * 16),
                ),
                GroupButton(
                  selectedTextStyle: TextStyle(
                      fontFamily: "Times New Roman",
                      color: Colors.black87,
                      fontWeight: FontWeight.bold),
                  unselectedTextStyle: TextStyle(
                      fontFamily: "Times New Roman", color: Colors.black87),
                  isRadio: true,
                  selectedBorderColor: Colors.blue.shade300,
                  selectedColor: Colors.blue.shade200,
                  unselectedColor: Colors.blue.shade100,
                  unselectedBorderColor: Colors.blue,
                  spacing: 10,
                  buttons: const [
                    "Her Gün",
                    'Her Gün Değil',
                  ],
                  borderRadius: BorderRadius.circular(30),
                  onSelected: (i, selected) => selectq2 = i + 1,
                ),
                Padding(padding: EdgeInsets.all(10.0)),
                SizedBox(height: 20),
                Text(
                  "Kan Basıncı Yüksekliği(Tansiyon) İçin Hiç İlaç Kullandınız Mı? Veya Sizde Yüksek Tansiyon Bulundu Mu?",
                  style: TextStyle(
                      fontFamily: "Times New Roman",
                      fontWeight: FontWeight.bold,
                      color: Colors.pink.shade900,
                      fontSize: MediaQuery.of(context).textScaleFactor * 16),
                ),
                GroupButton(
                  selectedTextStyle: TextStyle(
                      fontFamily: "Times New Roman",
                      color: Colors.black87,
                      fontWeight: FontWeight.bold),
                  unselectedTextStyle: TextStyle(
                      fontFamily: "Times New Roman", color: Colors.black87),
                  isRadio: true,
                  selectedBorderColor: Colors.blue.shade300,
                  selectedColor: Colors.blue.shade200,
                  unselectedColor: Colors.blue.shade100,
                  unselectedBorderColor: Colors.blue,
                  spacing: 10,
                  buttons: const [
                    "Evet",
                    'Hayır',
                  ],
                  borderRadius: BorderRadius.circular(30),
                  onSelected: (i, selected) => selectq3 = i + 1,
                ),
                Padding(padding: EdgeInsets.all(10.0)),
                SizedBox(height: 20),
                Text(
                  "Daha Önce Bir Uzman Tarafından kan şekerinizin yüksek ya da sınırda olduğu söylendi mi?  ",
                  style: TextStyle(
                      fontFamily: "Times New Roman",
                      fontWeight: FontWeight.bold,
                      color: Colors.pink.shade900,
                      fontSize: MediaQuery.of(context).textScaleFactor * 16),
                ),
                GroupButton(
                  selectedTextStyle: TextStyle(
                      fontFamily: "Times New Roman",
                      color: Colors.black87,
                      fontWeight: FontWeight.bold),
                  unselectedTextStyle: TextStyle(
                      fontFamily: "Times New Roman", color: Colors.black87),
                  isRadio: true,
                  selectedBorderColor: Colors.blue.shade300,
                  selectedColor: Colors.blue.shade200,
                  unselectedColor: Colors.blue.shade100,
                  unselectedBorderColor: Colors.blue,
                  spacing: 10,
                  buttons: const [
                    "Evet",
                    'Hayır',
                  ],
                  borderRadius: BorderRadius.circular(30),
                  onSelected: (i, selected) => selectq4 = i + 1,
                ),
                Padding(padding: EdgeInsets.all(10.0)),
                SizedBox(height: 20),
                Text(
                  "Aile Bireylerinizden Herhangi Birinde (Tip 1 Ya da Tip 2) Diyabet Tanısı Konulmuş Olanlar Var Mı ?",
                  style: TextStyle(
                      fontFamily: "Times New Roman",
                      fontWeight: FontWeight.bold,
                      color: Colors.pink.shade900,
                      fontSize: MediaQuery.of(context).textScaleFactor * 16),
                ),
                GroupButton(
                  selectedTextStyle: TextStyle(
                      fontFamily: "Times New Roman",
                      color: Colors.black87,
                      fontWeight: FontWeight.bold),
                  unselectedTextStyle: TextStyle(
                      fontFamily: "Times New Roman", color: Colors.black87),
                  isRadio: true,
                  selectedBorderColor: Colors.blue.shade300,
                  selectedColor: Colors.blue.shade200,
                  unselectedColor: Colors.blue.shade100,
                  unselectedBorderColor: Colors.blue,
                  spacing: 10,
                  buttons: const [
                    "Evet 1.Dereceden Akraba",
                    "Evet 2.Dereceden Akraba",
                    'Hayır',
                  ],
                  borderRadius: BorderRadius.circular(30),
                  onSelected: (i, selected) => selectq5 = i + 1,
                ),
                FlatButton(
                  color: Colors.blue.shade300,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        width: 3, color: Colors.blue, style: BorderStyle.solid),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Text(
                    "Bilgileri Getir",
                    style: TextStyle(
                        fontFamily: "Times New Roman",
                        color: Colors.pink.shade900,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                  onPressed: () {
                    if (selectq1 == 0 ||
                        selectq2 == 0 ||
                        selectq3 == 0 ||
                        selectq4 == 0 ||
                        selectq5 == 0) {
                      ScaffoldMessenger.of(context).showSnackBar(snackbar1);
                    } else {
                      calculateDiabetiaP();
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                            fontSize: 14),
                      ),
                      onPressed: () => calculateDiabetia(),
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
                            fontSize: 14),
                      ),
                      onPressed: () => {},
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
                          height: 10,
                        ),
                        AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          width: _isInitialValue
                              ? MediaQuery.of(context).size.width * 0.4
                              : MediaQuery.of(context).size.width * 0.2,
                          height: _isInitialValue
                              ? MediaQuery.of(context).size.width * 0.4
                              : MediaQuery.of(context).size.width * 0.2,
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
        ));
  }

  void calculateDiabetiaP() {
    riskpoint = 0;
    double height = double.parse(data["boy"].toString()) / 100;
    double weight = double.parse(data["kilo"].toString());
    double belly = double.parse(data["bel"].toString());
    double age = double.parse(data["yas"].toString());
    double heightSquare = height * height;
    double result = weight / heightSquare;
    String gender = data["cinsiyet"];
    riskPoint(result, age, belly, gender);
    setState(() {});
  }

  void calculateDiabetia() {
    riskpoint = 0;
    double height = double.parse(_heightController.text) / 100;
    double weight = double.parse(_weightController.text);
    double belly = double.parse(_bellyController.text);
    double age = double.parse(_ageController.text);
    double heightSquare = height * height;
    double result = weight / heightSquare;
    String gender = _interest.toString();
    riskPoint(result, age, belly, gender);
    setState(() {});
  }

  void riskPoint(double result, double age, double belly, String gender) {
    if (selectq1 == 2) riskpoint += 2;
    if (selectq2 == 2) riskpoint += 2;
    if (selectq3 == 1) riskpoint += 2;
    if (selectq4 == 1) riskpoint += 5;
    if (selectq5 == 2) riskpoint += 3;
    if (selectq5 == 3) riskpoint += 5;
    if (age < 45) riskpoint += 0;
    if (age > 45 && age < 55) riskpoint += 2;
    if (age >= 55 && age < 65) riskpoint += 3;
    if (age >= 65) riskpoint += 4;
    if (result < 25) riskpoint += 0;
    if (result >= 25 && result < 30) riskpoint += 1;
    if (result >= 30) riskpoint += 3;
    if (gender == "Kadın") {
      if (belly < 80) riskpoint += 0;
      if (belly >= 80 && belly < 88) riskpoint += 3;
      if (belly >= 88) riskpoint += 4;
    } else if (gender == "Erkek") {
      if (belly < 94) riskpoint += 0;
      if (belly >= 94 && belly < 102) riskpoint += 3;
      if (belly >= 102) riskpoint += 4;
    }
    showResult(riskpoint);
  }

  void showResult(int riskpoint) {
    if (riskpoint < 7) {
      sugges1 = "Risk Puanınız $riskpoint buna göre diyabet riskiniz düşük ";
      sugges2 =
          "Bilgileriniz ve risk puanınıza göre 10 yıl içinde risk oranınız %1";
    }
    if (riskpoint >= 7 && riskpoint <= 11) {
      sugges1 = "Risk Puanınız $riskpoint buna göre diyabet riskiniz hafif ";
      sugges2 =
          "Bilgileriniz ve risk puanınıza göre 10 yıl içinde risk oranınız %4";
    }
    if (riskpoint >= 12 && riskpoint <= 14) {
      sugges1 = "Risk Puanınız $riskpoint buna göre diyabet riskiniz orta ";
      sugges2 =
          "Bilgileriniz ve risk puanınıza göre 10 yıl içinde risk oranınız %16";
    }
    if (riskpoint >= 15 && riskpoint <= 19) {
      sugges1 = "Risk Puanınız $riskpoint buna göre diyabet riskiniz yüksek ";
      sugges2 =
          "Bilgileriniz ve risk puanınıza göre 10 yıl içinde risk oranınız %33";
    }
    if (riskpoint >= 20) {
      sugges1 =
          "Risk Puanınız $riskpoint buna göre diyabet riskiniz çok yüksek ";
      sugges2 =
          "Bilgileriniz ve risk puanınıza göre 10 yıl içinde risk oranınız %50";
    }
    setState(() {});
  }
}
