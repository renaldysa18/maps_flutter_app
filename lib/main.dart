import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Completer<GoogleMapController> _controller = Completer();

  final Set<Marker> _marker = {};

  final LatLng _position = LatLng(3.595196, 98.672226);

  @override
  void initState() {
    _marker.add(Marker(
      markerId: MarkerId('3.595196, 98.672226'),
      position:  _position,
      icon: BitmapDescriptor.defaultMarker,
    ));
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _position,
          zoom: 14.0,
        ),
        mapType: MapType.normal,
        markers: _marker,
          onTap: (position) {
            setState(() {
              _marker.add(
                Marker(
                  markerId:
                  MarkerId("${position.latitude}, ${position.longitude}"),
                  icon: BitmapDescriptor.defaultMarker,
                  position: position,
                ),
              );
            });
          }
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
