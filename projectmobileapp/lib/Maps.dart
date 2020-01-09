import "package:flutter/material.dart";
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';




class MyMapPage extends StatefulWidget {
  @override
  State<MyMapPage> createState() => MyMapPageState();
}

// class Locations  {
//   static Locations portland = new Locations(45.512794, -122.679565);
//   static Locations usa = new Locations(45.512794, -122.679565);

//   Locations(double d, double e);

// }

class MyMapPageState extends State<MyMapPage> {
  Completer<GoogleMapController> _controller = Completer();
  List<Marker> allMarkers = [];

  static final CameraPosition _kGooglePlex = new CameraPosition(
    target: LatLng(8.485433, 124.656532),
    bearing: 150.8334901395799,
    zoom: 15.151926040649414,
    tilt: 30.440717697143555, 
  );

 @override
  void initState() { 
    super.initState();
    allMarkers.add(Marker(
      markerId: MarkerId('MYMARKERS'),
      draggable: false,
      position: LatLng(8.485433, 124.656532),
    ));
    
  }
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Center( 
          
          child:Container( 
            padding: EdgeInsets.only(right: 50),
            child: Text("Show Map",
        style: TextStyle(
          fontFamily: "tangerine",
          color: Colors.grey[300],
          fontSize: 50,

        )
        ),
        ),
      ),
      ),
      body: GoogleMap(
        initialCameraPosition: _kGooglePlex,
        markers: Set.from(allMarkers),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      )
    );
  }
}

