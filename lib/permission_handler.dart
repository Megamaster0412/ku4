import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHandlerExample extends StatefulWidget {
  @override
  _PermissionHandlerExampleState createState() => _PermissionHandlerExampleState();
}

class _PermissionHandlerExampleState extends State<PermissionHandlerExample> {
  String _permissionStatus = "Requesting permission...";

  @override
  void initState() {
    super.initState();
    _requestLocationPermission();
  }

  Future<void> _requestLocationPermission() async {
    final PermissionStatus status = await Permission.location.request();
    switch (status) {
      case PermissionStatus.denied:
        setState(() {
          _permissionStatus = "Location permission denied.";
        });
        // Optionally, guide the user to the settings menu
        openAppSettings();
        break;
      case PermissionStatus.permanentlyDenied:
        setState(() {
          _permissionStatus = "Location permission permanently denied.";
        });
        // Guide the user to the settings menu
        openAppSettings();
        break;
      case PermissionStatus.granted:
        setState(() {
          _permissionStatus = "Location permission granted.";
        });
        break;
      default:
        setState(() {
          _permissionStatus = "Location permission status: $status";
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Permission Handler Example'),
      ),
      body: Center(
        child: Text(_permissionStatus),
      ),
    );
  }
}
