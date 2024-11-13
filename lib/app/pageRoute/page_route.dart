import 'package:get/get.dart';
import 'package:idealista/app/ui/auth/login/login.dart';
import 'package:idealista/app/ui/dashboard/dashboard.dart';
import 'package:idealista/app/ui/splash/splash.dart';
import '../ui/registration/aadhaar_detail/aadhaar_detail.dart';
import '../ui/registration/bank_detail/bank_detail.dart';
import '../ui/registration/please_wait/please_wait.dart';
import '../ui/registration/profile_info/profile_info.dart';
import '../ui/registration/registration.dart';
import '../ui/splash/start_splash.dart';

class PageRoutes {
  static final List<GetPage> routes = [
    GetPage(name: '/splash', page: () => const Splash()),
    GetPage(name: '/startSplash', page: () => const StartSplash()),
    GetPage(name: '/login', page: () => const Login()),
    GetPage(name: '/registration', page: () => const Registration()),
    GetPage(name: '/profileInfo', page: () => const ProfileInfo()),
    GetPage(name: '/bankDetail', page: () => const BankDetail()),
    GetPage(name: '/aadhaarDetail', page: () => const AadhaarDetail()),
    GetPage(name: '/pleaseWait', page: () => const PleaseWait()),
    GetPage(name: '/dashboard', page: () => const Dashboard()),
  ];
}
