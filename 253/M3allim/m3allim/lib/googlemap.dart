import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class Gmap extends StatefulWidget {
  @override
  _GmapDisplay createState() => _GmapDisplay();
}

class _GmapDisplay extends State<Gmap> {
  GoogleMapController mapController;
  static const LatLng _center = const LatLng(45.521563, -122.677433);
  LatLng _lastMapPosition = _center;
  final Set<Marker> _markers = {};

  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0.0,
      //   title: Text(
      //     'Map',
      //     style: TextStyle(
      //         fontFamily: 'Montserrat', fontSize: 15.0, color: Colors.black),
      //   ),
      //   centerTitle: true,
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back),
      //     color: Colors.black,
      //     iconSize: 17.0,
      //     onPressed: () {},
      //   ),
      //   actions: <Widget>[
      //     IconButton(
      //       icon: Icon(Icons.search),
      //       color: Colors.black,
      //       iconSize: 17.0,
      //       onPressed: () {},
      //     ),
      //   ],
      // ),
      body: Stack(children: <Widget>[
        gMap(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.topRight,
            child: Column(
              children: <Widget>[
                FloatingActionButton(
                  onPressed: _onMapTypeButtonPressed,
                  materialTapTargetSize: MaterialTapTargetSize.padded,
                  backgroundColor: Colors.green,
                  child: const Icon(Icons.map, size: 36.0),
                ),
                SizedBox(height: 16.0),
                FloatingActionButton(
                  onPressed: _onAddMarkerButtonPressed,
                  materialTapTargetSize: MaterialTapTargetSize.padded,
                  backgroundColor: Colors.green,
                  child: const Icon(Icons.add_location, size: 36.0),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  Widget gMap() {
    print("Entered GMAP");
    return Column(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: GoogleMap(
            markers: _markers,
            myLocationEnabled: true,
            onCameraMove: _onCameraMove,
            initialCameraPosition:
                CameraPosition(target: LatLng(42.5, 32.5), zoom: 9.0),
            rotateGesturesEnabled: false,
            scrollGesturesEnabled: true,
            tiltGesturesEnabled: false,
            onMapCreated: (GoogleMapController controller) {
              mapController = controller;
            },
          ),
        ),
      ],
    );
  }

  MapType _currentMapType = MapType.normal;

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  void _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        infoWindow: InfoWindow(
          title: 'Really cool place',
          snippet: '5 Star Rating',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }
}
