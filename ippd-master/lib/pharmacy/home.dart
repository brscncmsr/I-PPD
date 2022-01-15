import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class Constants {
  static const APP_TITLE = "$CITY Eczane";
  static const CITY = "Gaziantep";

  static const BASE_URL = "https://api.collectapi.com/health/dutyPharmacy";
  static const BASE_URL_WITH_CITY =
      "https://api.collectapi.com/health/dutyPharmacy?il=$CITY";
  static const COLLECT_API_KEY =
      "apikey 5BLvMHHfki7wAIVDMw5Kq6:0dTC7WnRiiCmZHmmblsGa7";
}

class EczaneApp extends StatefulWidget {
  @override
  _EczaneAppState createState() => _EczaneAppState();
}

class _EczaneAppState extends State<EczaneApp> {
  Completer<GoogleMapController> _controller = Completer();

  List<Pharmacy> pharmacyList = [];
  List<LatLng> latLongList = [];
  List<String> districtList = [];
  String selectedDistrict = "";
  Set<Marker> markers = Set<Marker>();
  bool isVisible = true;

  @override
  void initState() {
    super.initState();
    getData().then((value) => fillMarkerList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      body: isVisible ? progressIndicatior : mapBody,
    );
  }

  AppBar get appBar {
    return AppBar(
      backgroundColor: Colors.blue.shade300,
      title: Text(
        "${Constants.APP_TITLE}",
        style: TextStyle(
            fontFamily: "Times New Roman",
            fontWeight: FontWeight.bold,
            color: Colors.pink.shade900),
      ),
      actions: [buildDropdownList()],
    );
  }

  Card buildDropdownList() {
    return Card(
      child: DropdownButton<String>(
        value: selectedDistrict,
        items: districtList.map((String value) {
          return new DropdownMenuItem<String>(
            value: value,
            child: new Text(value),
          );
        }).toList(),
        onChanged: (String? district) async {
          await getDataByDistrict(district!);
          await moveCamera(latLongList.first);
          setState(() {
            selectedDistrict = district;
          });
        },
      ),
    );
  }

  Center get progressIndicatior => Center(child: CircularProgressIndicator());

  Stack get mapBody {
    return Stack(
      children: [
        Container(
          color: Colors.blue.shade300,
          height: double.infinity,
          child: GoogleMap(
            mapType: MapType.normal,
            markers: markers,
            initialCameraPosition:
                CameraPosition(target: latLongList.first, zoom: 15),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
        ),
        buildCardView(),
      ],
    );
  }

  void fillMarkerList() {
    markers.clear();
    latLongList.clear();

    pharmacyList.forEach((element) {
      double lat = double.parse(element.loc.split(",").first.trim());
      double long = double.parse(element.loc.split(",").last.trim());

      latLongList.add(LatLng(lat, long));

      if (!districtList.contains(element.dist)) districtList.add(element.dist);

      markers.add(Marker(
          markerId: MarkerId("$element"),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
          position: LatLng(lat, long),
          visible: true,
          draggable: true,
          infoWindow: InfoWindow(
              title: "${element.name}", snippet: "${element.address}"),
          onTap: () {}));
    });

    selectedDistrict = districtList.first;

    setState(() {
      isVisible = false;
    });
  }

  Container buildCardView() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.25,
      child: PageView.builder(
        physics: BouncingScrollPhysics(),
        controller: PageController(viewportFraction: 0.8),
        itemCount: pharmacyList.length,
        itemBuilder: (context, index) => buildPharmacyCard(index),
        onPageChanged: (index) async {
          await moveCamera(latLongList[index]);
        },
      ),
    );
  }

  Padding buildPharmacyCard(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: InkWell(
        onTap: () async => await launch("tel:${pharmacyList[index].phone}"),
        child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(
                width: 3, color: Colors.blue, style: BorderStyle.solid),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          color: Colors.blue.shade300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "${pharmacyList[index].name}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text("${pharmacyList[index].dist}"),
              Text(
                "${pharmacyList[index].address}",
                textAlign: TextAlign.center,
              ),
              Text("${pharmacyList[index].phone}"),
              Text("Eczaneyi aramak için dokunun.",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getData() async {
    final http.Response httpResponse = await http
        .get(Uri.parse(Constants.BASE_URL_WITH_CITY), headers: <String, String>{
      'authorization': '${Constants.COLLECT_API_KEY}',
      'content-type': 'application/json',
    });

    if (httpResponse.statusCode == HttpStatus.ok) {
      final responseData = jsonDecode(httpResponse.body);
      final responseList = responseData["result"] as List;
      pharmacyList = responseList.map((e) => Pharmacy.fromJson(e)).toList();
    }
  }

  Future<void> getDataByDistrict(String district) async {
    final http.Response httpResponse = await http.get(
        Uri.parse("${Constants.BASE_URL}?ilce=$district&il=${Constants.CITY}"),
        headers: <String, String>{
          'authorization': '${Constants.COLLECT_API_KEY}',
          'content-type': 'application/json',
        });

    if (httpResponse.statusCode == HttpStatus.ok) {
      final responseData = jsonDecode(httpResponse.body);
      final responseList = responseData["result"] as List;
      pharmacyList = responseList.map((e) => Pharmacy.fromJson(e)).toList();

      markers.clear();
      latLongList.clear();
      pharmacyList.forEach((element) {
        double lat = double.parse(element.loc.split(",").first.trim());
        double long = double.parse(element.loc.split(",").last.trim());

        latLongList.add(LatLng(lat, long));

        if (!districtList.contains(element.dist))
          districtList.add(element.dist);

        markers.add(Marker(
            markerId: MarkerId("$element"),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueAzure),
            position: LatLng(lat, long),
            visible: true,
            infoWindow: InfoWindow(
                title: "${element.name}", snippet: "${element.address}"),
            onTap: () {}));
      });
    }
  }

  Future<void> moveCamera(LatLng target) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: target,
      zoom: 15,
    )));
  }
}

class Pharmacy {
  late String name;
  late String dist;
  late String address;
  late String phone;
  late String loc;

  Pharmacy(
      {required this.name,
      required this.dist,
      required this.address,
      required this.phone,
      required this.loc});

  Pharmacy.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    dist = json['dist'];
    address = json['address'];
    phone = json['phone'];
    loc = json['loc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['dist'] = this.dist;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['loc'] = this.loc;
    return data;
  }

  @override
  String toString() {
    return 'Pharmacy{name: $name, dist: $dist, address: $address, phone: $phone, loc: $loc}';
  }
}
