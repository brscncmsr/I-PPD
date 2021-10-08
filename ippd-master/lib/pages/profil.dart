import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profil extends StatefulWidget {
  Profil({Key? key}) : super(key: key);

  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  Future<Null> refresh() async {
    await Future.delayed(Duration(seconds: 2));
  }

  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  String _name = "Ad ve Soyad";
  String _height = "Boyunuzu Girin";
  String _weight = "Kilonuzu Girin";
  String _age = "Yaşınızı Girin";

  bool status1 = false;
  bool status2 = false;
  bool status3 = false;
  bool status4 = false;
  bool status5 = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          //brightness: Brightness.dark,
          ),
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/img/background.png'),
                  repeat: ImageRepeat.repeat,
                  colorFilter:
                      ColorFilter.mode(Colors.white60, BlendMode.color),
                  fit: BoxFit.cover)),
          child: Scaffold(
            body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/img/background.png'),
                      repeat: ImageRepeat.repeat,
                      colorFilter:
                          ColorFilter.mode(Colors.white60, BlendMode.color),
                      fit: BoxFit.cover)),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 525,
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.only(top: 10),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          side:
                              BorderSide(width: 3, color: Colors.blue.shade200),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: ListView(
                          children: [
                            status1
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                        TextField(
                                          controller: _nameController,
                                          keyboardType: TextInputType.name,
                                          decoration: InputDecoration(
                                            //counterText: 'max değeri geçmeyiniz',
                                            helperText: 'Adınız ve Soyadınız',
                                            icon: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.05,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.05,
                                                child: Image(
                                                    fit: BoxFit.fill,
                                                    image: AssetImage(
                                                        'assets/img/nurse.png'))),
                                            labelText: 'Adınız ve Soyadınız',
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                            ),
                                          ),
                                        ),
                                        RaisedButton(
                                            color: Colors.blue.shade200,
                                            child: Text(
                                              "Kaydet",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            onPressed: () => getMenu()),
                                      ])
                                : ListTile(
                                    contentPadding: EdgeInsets.all(10),
                                    title: Text("Ad Soyad"),
                                    subtitle: Text(_name),
                                    leading: Icon(CupertinoIcons
                                        .person_crop_circle_fill), //başına ikon
                                    trailing:
                                        Icon(Icons.arrow_forward_ios_rounded),
                                    onTap: () => {name()},

                                    //sonuna ikon
                                  ),
                            status2
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                        TextField(
                                          controller: _heightController,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            //counterText: 'max değeri geçmeyiniz',
                                            helperText: 'Örnek olarak 160',
                                            icon: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.05,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.05,
                                                child: Image(
                                                    fit: BoxFit.fill,
                                                    image: AssetImage(
                                                        'assets/img/height.png'))),
                                            labelText: 'Boyunuzu Giriniz',
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                            ),
                                          ),
                                        ),
                                        RaisedButton(
                                            color: Colors.blue.shade200,
                                            child: Text(
                                              "Kaydet",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            onPressed: () => getMenu()),
                                      ])
                                : ListTile(
                                    contentPadding: EdgeInsets.all(10),
                                    title: Text("Boy"),
                                    subtitle: Text(_height),
                                    leading: Icon(Icons.height), //başına ikon
                                    trailing:
                                        Icon(Icons.arrow_forward_ios_rounded),
                                    onTap: () => {height()}, //sonuna ikon
                                  ),
                            status3
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                        TextField(
                                          controller: _weightController,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            //counterText: 'max değeri geçmeyiniz',
                                            helperText: 'Örnek olarak 80',
                                            icon: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.05,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.05,
                                                child: Image(
                                                    fit: BoxFit.fill,
                                                    image: AssetImage(
                                                        'assets/img/weight.png'))),
                                            labelText: 'Kilonuzu Giriniz',
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                            ),
                                          ),
                                        ),
                                        RaisedButton(
                                            color: Colors.blue.shade200,
                                            child: Text(
                                              "Kaydet",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            onPressed: () => getMenu()),
                                      ])
                                : ListTile(
                                    contentPadding: EdgeInsets.all(10),
                                    title: Text("Kilo"),
                                    subtitle: Text(_weight),
                                    leading: Icon(
                                        Icons.fitness_center), //başına ikon
                                    trailing:
                                        Icon(Icons.arrow_forward_ios_rounded),
                                    onTap: () => {weight()}, //sonuna ikon
                                  ),
                            status4
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                        TextField(
                                          controller: _ageController,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            //counterText: 'max değeri geçmeyiniz',
                                            helperText: 'Örnek olarak 20',
                                            icon: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.05,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.05,
                                                child: Image(
                                                    fit: BoxFit.fill,
                                                    image: AssetImage(
                                                        'assets/img/age.png'))),
                                            labelText: 'Yaşınızı Giriniz',
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                            ),
                                          ),
                                        ),
                                        RaisedButton(
                                            color: Colors.blue.shade200,
                                            child: Text(
                                              "Kaydet",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            onPressed: () => getMenu()),
                                      ])
                                : ListTile(
                                    contentPadding: EdgeInsets.all(10),
                                    title: Text("Yaş"),
                                    subtitle: Text(_age),
                                    leading: Icon(CupertinoIcons
                                        .person_crop_circle_fill), //başına ikon
                                    trailing:
                                        Icon(Icons.arrow_forward_ios_rounded),
                                    onTap: () => {age()}, //sonuna ikon
                                  ),
                            ListTile(
                              contentPadding: EdgeInsets.all(10),
                              title: Text("Kan Grubu"),
                              subtitle: Text("Bilgi"),
                              leading: Icon(Icons.bloodtype), //başına ikon
                              trailing: Icon(Icons
                                  .arrow_forward_ios_rounded), //sonuna ikon
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.all(10),
                              title: Text("Telefon Numaranız"),
                              subtitle: Text("Bilgi"),
                              leading: Icon(Icons.phone), //başına ikon
                              trailing: Icon(Icons
                                  .arrow_forward_ios_rounded), //sonuna ikon
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: Colors.blue.shade200,
                      ),
                      width: MediaQuery.of(context).size.height * 0.17,
                      height: MediaQuery.of(context).size.height * 0.06,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          side:
                              BorderSide(width: 3, color: Colors.blue.shade300),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Çıkış Yap",
                          style: GoogleFonts.patrickHand(
                            fontSize: 24,
                            color: Colors.white60,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void name() {
    status1 = true;
    setState(() {});
  }

  void height() {
    status2 = true;

    setState(() {});
  }

  void weight() {
    status3 = true;
    setState(() {});
  }

  void age() {
    status4 = true;
    setState(() {});
  }

  void gender() {
    setState(() {});
  }

  void getMenu() {
    _name = _nameController.text;
    _height = "Boyunuz ${_heightController.text}";
    _weight = "Kilonuz ${_weightController.text}";
    _age = "Yaşınız ${_ageController.text}";

    status1 = false;
    status2 = false;
    status3 = false;
    status4 = false;
    setState(() {});
  }
}
