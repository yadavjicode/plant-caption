import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idealista/app/api_service/api_service.dart';
import 'package:idealista/app/model/my_profile_model.dart';
import 'package:idealista/app/ui/widget/CustomSnackbar.dart';

class MyProfilrController extends GetxController {
  final ApiService apiService = ApiService();
  MyProfileModel? _member;
  var isLoading = false.obs;
  String? _error;
  MyProfileModel? get member => _member;
  String? get error => _error;
  // final ConnectivityService connectivityService =
  //   Get.put(ConnectivityService());

  Future<void> myProfile(BuildContext context) async {
    isLoading.value = true;
    _error = null;

    try {
      _member = await apiService.myProfile();
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
    }
  }
}
