import 'package:get/get.dart';
import 'package:idealista/app/ui/auth/login/login.dart';
import 'package:idealista/app/ui/auth/otp/otp.dart';
import 'package:idealista/app/ui/dashboard/dashboard.dart';
import 'package:idealista/app/ui/splash/splash.dart';
import '../ui/registration/aadhaar_detail/aadhaar_detail.dart';
import '../ui/registration/bank_detail/bank_detail.dart';
import '../ui/registration/please_wait/please_wait.dart';
import '../ui/registration/profile_info/profile_info.dart';
import '../ui/registration/registration.dart';
import '../ui/splash/start_splash.dart';

class PageRoutes {
  static const String splash = '/splash';
  static const String startSplash = '/startSplash';
  static const String login = '/login';
  static const String registration = '/registration';
  static const String profileInfo = '/profileInfo';
  static const String bankDetail = '/bankDetail';
  static const String aadhaarDetail = '/aadhaarDetail';
  static const String pleaseWait = '/pleaseWait';
  static const String dashboard = '/dashboard';
  static const String otpScreen = '/otpScreen';

  static final List<GetPage> routes = [
    GetPage(
      name: splash,
      page: () => const Splash(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: startSplash,
      page: () => const StartSplash(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: login,
      page: () => const Login(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: registration,
      page: () => const Registration(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: profileInfo,
      page: () => const ProfileInfo(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: bankDetail,
      page: () => const BankDetail(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: aadhaarDetail,
      page: () => const AadhaarDetail(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: pleaseWait,
      page: () => const PleaseWait(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: dashboard,
      page: () => const Dashboard(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: otpScreen,
      page: () => const OTPScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),

    // GetPage(name: '/splash', page: () => const Splash()),
    // GetPage(name: '/startSplash', page: () => const StartSplash()),
    // GetPage(name: '/login', page: () => const Login()),
    // GetPage(name: '/registration', page: () => const Registration()),
    // GetPage(name: '/profileInfo', page: () => const ProfileInfo()),
    // GetPage(name: '/bankDetail', page: () => const BankDetail()),
    // GetPage(name: '/aadhaarDetail', page: () => const AadhaarDetail()),
    // GetPage(name: '/pleaseWait', page: () => const PleaseWait()),
    // GetPage(name: '/dashboard', page: () => const Dashboard()),
    // GetPage(name: '/otpScreen', page: () => const OTPScreen()),
  ];
}
