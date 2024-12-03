import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idealista/app/api_service/api_service.dart';
import 'package:idealista/app/controller/my_profile_controller%20copy.dart';
import 'package:idealista/app/model/verify_otp_model.dart';
import 'package:idealista/app/pageRoute/page_route.dart';
import 'package:idealista/app/ui/widget/CustomSnackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VerifyOtpController with ChangeNotifier {
  final ApiService apiService = ApiService();
  final MyProfilrController myProfilrController =
      Get.put(MyProfilrController());
  VerifyOtpModel? _member;
  var isLoading = false.obs;
  String? _error;
  VerifyOtpModel? get member => _member;
  String? get error => _error;
  // final ConnectivityService connectivityService =
  //     Get.put(ConnectivityService());

  Future<void> verifyOtp(
      BuildContext context, String phoneno, String otp) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      _member = await apiService.verifyOtp("+91${phoneno}", otp);

      print('${_member?.message}');

      // ignore: use_build_context_synchronously
      CustomSanckbar.showSnackbar(context, member?.message ?? "", true);
      if (member?.message == "OTP Verified Successfully") {
        final prefs = await SharedPreferences.getInstance();
        final token = _member?.data?.token;
        if (token != null) {
          await prefs.setString('token', token);
          myProfilrController.myProfile(context).then((_) {
            if (myProfilrController.member?.data?.profileInfoStepFirst &&
                myProfilrController.member?.data?.aadharInfoStepSecond &&
                myProfilrController.member?.data?.bankInfoStepThird) {
              Get.offAndToNamed(PageRoutes.pleaseWait);
            } else {
              Get.offAndToNamed(PageRoutes.registration);
            }
          });
        } else {
          throw Exception('Invalid OTP');
        }
      }
    } catch (e) {
      _error = e.toString();
      print(_error);
      // if (!connectivityService.isConnected.value) {
      //   CustomSanckbar.showSnackbar(context, "No internet connection!", false);
      // } else {
      CustomSanckbar.showSnackbar(
          context,
          "Something went wrong while fetching data. Please try again later!",
          false);
      // }
    } finally {
      isLoading.value = false;
      notifyListeners();
    }
  }
}
