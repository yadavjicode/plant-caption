import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idealista/app/api_service/api_service.dart';
import 'package:idealista/app/model/send_otp_model.dart';
import 'package:idealista/app/ui/widget/CustomSnackbar.dart';

class SendOtpController with ChangeNotifier {
  final ApiService apiService = ApiService();
  SendOtpModel? _member;
  var isLoading = false.obs;
  String? _error;
  SendOtpModel? get member => _member;
  String? get error => _error;
  // final ConnectivityService connectivityService =
  //     Get.put(ConnectivityService());

  Future<void> sendOtp(BuildContext context, String phoneno) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      _member = await apiService.sendOtp("+91${phoneno}");

      print('${_member?.message}');

      // ignore: use_build_context_synchronously
      CustomSanckbar.showSnackbar(context, member?.message ?? "", true);
      // Get.off(() => OTPScreen(mobileNumber: phoneEmail));

      print("success");
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
