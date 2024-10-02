import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const LatLng currentlocation = LatLng(24.8607, 67.0011);

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  final Map<String, Marker> _markers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition:
            const CameraPosition(target: 
            currentlocation, zoom: 14),
          onMapCreated: (controller) {
          mapController = controller;
          addmarker("test", currentlocation);
        },
        markers: _markers.values.toSet(),
      ),
    );
  }

  addmarker(String markerId, LatLng location) {

    
    var marker = Marker(
      markerId: MarkerId(markerId), 
      position: location,
      infoWindow: const InfoWindow(
        title: 'TITLE OF PLACE',
        snippet: 'some description of the place'
      ));

    _markers[markerId] = marker;
    setState(() {
    });
  }
}
