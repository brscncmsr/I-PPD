import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ippd/pharmacy/filter.dart';
import 'package:ippd/pharmacy/listing.dart';
import 'globals.dart' as globals;

@immutable
class GoogleMapsPage extends StatefulWidget {
  @override
  State<GoogleMapsPage> createState() => GoogleMapsPageState();
}

class GoogleMapsPageState extends State<GoogleMapsPage> {
  Completer<GoogleMapController> _controller = Completer();

  LatLngBounds? bounds;

  @override
  void initState() {
    print("GMap Started");
    print(globals.pharmacyMarkers);
    bounds = boundsFromLatLngList();
    print(bounds);
    super.initState();
  }

  LatLngBounds boundsFromLatLngList() {
    List<LatLng> list = [];
    //assert(list.isNotEmpty);
    for (var marker in globals.pharmacyMarkers) {
      list.add(marker.position);
    }
    double? x0, x1, y0, y1;
    for (LatLng latLng in list) {
      if (x0 == null) {
        x0 = x1 = latLng.latitude;
        y0 = y1 = latLng.longitude;
      } else {
        if (latLng.latitude > x1!) x1 = latLng.latitude;
        if (latLng.latitude < x0) x0 = latLng.latitude;
        if (latLng.longitude > y1!) y1 = latLng.longitude;
        if (latLng.longitude < y0!) y0 = latLng.longitude;
      }
    }
    return LatLngBounds(
        northeast: LatLng(x1!, y1!), southwest: LatLng(x0!, y0!));
  }

  static final CameraPosition _initPos = CameraPosition(
    target: LatLng(38.4570895, 37.2712243),
    zoom: 6,
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            compassEnabled: true,
            buildingsEnabled: true,
            mapType: MapType.normal,
            initialCameraPosition: _initPos,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              WidgetsBinding.instance!.addPostFrameCallback((_) {
                controller
                    .animateCamera(CameraUpdate.newLatLngBounds(bounds!, 250));
              });
            },
            markers: Set.from(globals.pharmacyMarkers),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 150, height: 50),
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
                    "Filtrele",
                    style: GoogleFonts.patrickHand(
                      fontSize: 24,
                      color: Colors.white60,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16, top: 40),
            child: Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 150, height: 50),
                child: FlatButton(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 3, color: Colors.blue.shade300),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  onPressed: () {
                    goToPharmacyList();
                  },
                  child: Text(
                    "Nöbetçi Eczaneler",
                    style: GoogleFonts.patrickHand(
                      fontSize: 24,
                      color: Colors.white60,
                      fontWeight: FontWeight.bold,
                    ),
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
  

  Future<void> goToPharmacyList() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Listing()),
    );
  }
}
