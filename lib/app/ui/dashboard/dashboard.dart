import 'package:flutter/material.dart';
import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:idealista/app/constant/app_color.dart';
import 'package:idealista/app/ui/dashboard/feeds/feeds.dart';
import 'package:idealista/app/ui/dashboard/home/home.dart';
import 'package:idealista/app/ui/dashboard/payout/payout.dart';
import 'package:idealista/app/ui/widget/custom_drawer.dart';
import 'package:idealista/app/widget/font_constant.dart';

class CurrentLocation extends StatefulWidget {
  const CurrentLocation({Key? key}) : super(key: key);

  @override
  _CurrentLocationState createState() => _CurrentLocationState();
}

class _CurrentLocationState extends State<CurrentLocation> {
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



class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<Widget> _pages = [
    home(),
    Feeds(),
    Payout(),
     SizedBox.shrink(),
  ];

  void _onItemTapped(int index) {
   if (index == 3) {
      // Open the drawer when "My Account" is tapped
      _scaffoldKey.currentState?.openDrawer();
    } else {
      // Navigate to other pages
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColor.backgroundColor,
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColor.backgroundColor,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: FontConstant.styleSemiBold(
            fontSize: 13, color: AppColor.primaryColor),
        unselectedLabelStyle:
            FontConstant.styleMedium(fontSize: 12, color: AppColor.darkgrey),
        selectedItemColor:
            AppColor.primaryColor, // Set color for selected item text and icon
        unselectedItemColor: AppColor.darkgrey,
        onTap: _onItemTapped, // Handle navigation
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feed),
            label: 'Feeds',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.currency_rupee),
            label: 'payout',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Account',
          ),
        ],
      ),
      drawer: CustomDrawer(scaffoldKey: _scaffoldKey),
    );
  }
}
