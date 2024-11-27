import 'package:flutter/material.dart';
import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:idealista/app/constant/app_color.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Completer<GoogleMapController> _controller = Completer();
  final List<Marker> _markers = <Marker>[];

  @override
  void initState() {
    super.initState();
    _showCurrentLocation();
  }

  Future<void> _showCurrentLocation() async {
    // Get the user's current location
    Position position = await getUserCurrentLocation();

    // Add marker at the user's current location
    _markers.add(Marker(
      markerId: MarkerId("current_location"),
      position: LatLng(position.latitude, position.longitude),
      infoWindow: const InfoWindow(
        title: 'My Current Location',
      ),
    ));

    // Set camera position to user's current location
    CameraPosition cameraPosition = CameraPosition(
      target: LatLng(position.latitude, position.longitude),
      zoom: 14,
    );

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    setState(() {});
  }

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission();
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0F9D58),
        title: Text(
          "Location",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(47.5162, 14.5501), // Default position in Austria
                zoom: 10,
              ),
              markers: Set<Marker>.of(_markers),
              mapType: MapType.normal,
              myLocationEnabled: true,
              compassEnabled: true,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
            Positioned(
              left: 10,
              bottom: 10,
              child: GestureDetector(
                onTap: _showCurrentLocation,
                child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                        color: AppColor.whiteColor, shape: BoxShape.circle),
                    child: const Icon(Icons.location_searching)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
