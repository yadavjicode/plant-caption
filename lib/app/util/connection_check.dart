

// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:get/get.dart';

// class ConnectivityService extends GetxController {
//   // Observable variable to track connection status
//   var isConnected = true.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     _checkConnection(); // Initial connection check
//     _listenForConnectionChanges(); // Real-time monitoring
//   }

//   // Initial check for internet connection
//   Future<void> _checkConnection() async {
//     try {
//       ConnectivityResult result = await Connectivity().checkConnectivity();
//       _updateConnectionStatus(
//           result); // Update status based on connectivity result
//     } catch (e) {
//       print("Error checking connectivity: $e");
//       isConnected.value = false; // If check fails, assume no connection
//     }
//   }

//   // Listen for real-time connection status changes
//   void _listenForConnectionChanges() {
//     // Listen for changes in connectivity status
//     Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
//       _updateConnectionStatus(result);
//     });
//   }

//   // Update the connection status
//   void _updateConnectionStatus(ConnectivityResult result) {
//     // If mobile data or Wi-Fi is connected, update the status to true
//     if (result == ConnectivityResult.mobile ||
//         result == ConnectivityResult.wifi) {
//       isConnected.value = true;
//     } else {
//       isConnected.value = false; // Otherwise, set it to false
//     }
//   }
// }
