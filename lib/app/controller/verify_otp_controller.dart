import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idealista/app/api_service/api_service.dart';
import 'package:idealista/app/model/verify_otp_model.dart';
import 'package:idealista/app/ui/widget/CustomSnackbar.dart';
import 'package:idealista/app/util/connection_check.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VerifyOtpController with ChangeNotifier {
  final ApiService apiService = ApiService();
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
          Get.offAndToNamed('/registration');
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
