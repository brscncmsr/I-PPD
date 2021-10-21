import 'dart:async';
import 'dart:convert';

import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:ippd/pharmacy/filter.dart';
import 'google_maps.dart';
import 'globals.dart' as globals;

class NobetciEczane extends StatefulWidget {
  @override
  State<NobetciEczane> createState() => NobetciEczaneState();
}

class NobetciEczaneState extends State<NobetciEczane> {
  var url = Uri.parse('http://163.172.168.20/eczane-api.json');
  //var url = Uri.parse('4zlXku1jzlBdcSPXDotwettaWGOhc2H4MFXZlY9Aw9xA4ejygjKGEl25Dya8');
  void getIl() async {
    final response = await http.get(url, headers: {});
    var listData = jsonDecode(utf8.decode(response.bodyBytes));
    setState(() {
      globals.dataCities = listData['data'];
    });
    print("Data Il : $listData");
    getIlce("22");
  }

  void getIlce(String value) async {
    //var iller = jsonDecode(_valIl);
    var ilID = value;
    print(ilID);
    for (var il in globals.dataCities) {
      if (il['CityID'] == ilID) {
        var area = il['area'];
        print("Data City : $area");
        setState(() {
          globals.dataTowns = area;
        });
        break;
      }
    }
    print(globals.dataTowns);
  }

  @override
  void initState() {
    getIl();
    print("APP STARTED");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.center,
              child: FlatButton(
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 3, color: Colors.blue.shade300),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                onPressed: () {
                  goToFilter();
                },
                child: Text(
                  "Eczaneleri Gör",
                  style: GoogleFonts.patrickHand(
                    fontSize: 24,
                    color: Colors.white60,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> goToFilter() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FilterPage()),
    );
  }
}
