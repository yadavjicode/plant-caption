import 'package:get/get.dart';
import 'package:idealista/app/ui/auth/login/login.dart';
import 'package:idealista/app/ui/splash/splash.dart';
import '../ui/registration/registration.dart';
import '../ui/splash/start_splash.dart';

class PageRoutes {
  static final List<GetPage> routes = [
    GetPage(name: '/splash', page: () => const Splash()),
    GetPage(name: '/startSplash', page: () => const StartSplash()),
    GetPage(name: '/login', page: () => const Login()),
    GetPage(name: '/registration', page: () => const Registration()),
  ];
}
