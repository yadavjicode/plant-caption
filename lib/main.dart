import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:idealista/app/pageRoute/page_route.dart';

import 'app/util/size.dart';

// degduyed edied eide dceidc wdcidw cdwic dwcidwc dwkcb wdcidw cdwicv
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyDazDHtNCe3qzg5PTNmqtZtSCGlRLNOFv4",
        appId: "1:865311297634:android:861c3e277fcc816500813b",
        messagingSenderId: "865311297634",
        projectId: "my-space-2e365"),
  );
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.green,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetMaterialApp(
      initialRoute: '/splash', // Set initial route
      getPages: PageRoutes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
