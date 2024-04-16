import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapPage extends StatefulWidget {
  final double destinationLatitude;
  final double destinationLongitude;

  GoogleMapPage({required this.destinationLatitude, required this.destinationLongitude});

  @override
  _GoogleMapPageState createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  late GoogleMapController mapController;
  late LatLng _center;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    super.initState();
    _center = LatLng(widget.destinationLatitude, widget.destinationLongitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Map'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 15.0,
        ),
        markers: {
          Marker(
              markerId: MarkerId('destination'),
              position: _center,
              infoWindow: InfoWindow(
                title: 'Destination',
                snippet: 'Your target destination',
              )
          ),
        },
      ),
    );
  }

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }
}
