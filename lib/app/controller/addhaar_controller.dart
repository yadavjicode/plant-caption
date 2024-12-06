import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idealista/app/api_service/api_service.dart';
import 'package:idealista/app/constant/app_color.dart';
import 'package:idealista/app/controller/my_profile_controller%20copy.dart';
import 'package:idealista/app/model/aadhaar_details_model.dart';
import 'package:idealista/app/ui/widget/CustomSnackbar.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class AddhaarController extends GetxController {
  var isLoading = false.obs;
  var frontAddharImage = Rx<File?>(null);
  var backAddharImage = Rx<File?>(null);
  final ApiService apiService = ApiService();
  AadhaarDetailsModel? _member;
  String? _error;
  AadhaarDetailsModel? get member => _member;
  String? get error => _error;
  final MyProfilrController myProfilrController =
      Get.put(MyProfilrController());

  Future<void> aadhaarDetails(BuildContext context, String aadhaarNumber,
      File aadharImgFrontSide, File aadharImgBackSide) async {
    isLoading.value = true;
    _error = null;

    try {
      _member = await apiService.aadhaarDetails(
          aadhaarNumber, aadharImgFrontSide, aadharImgBackSide);

      CustomSanckbar.showSnackbar(context, member?.message ?? "", true);
      myProfilrController.myProfile(context).then((_) {
        Get.offAndToNamed("/bankDetail");
      });

      print('${_member?.message}');
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

  // // Method to handle the complete profile update process

  // Method to pick an image from the gallery
  Future<void> pickImageFromGallery(bool side) async {
    final picker = ImagePicker();
    try {
      final XFile? pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 100,
        maxHeight: 1000,
        maxWidth: 1000,
      );

      if (pickedFile != null) {
        await cropImage(File(pickedFile.path), side);
        Get.back(); // Close bottom sheet after selection
      } else {
        Navigator.of(Get.context!).pop();
        print('No image selected.');
        _showSnackBar('No image selected.');
      }
    } catch (e) {
      Navigator.of(Get.context!).pop();
      print('Error while selecting image: $e');
      _showSnackBar('Error while selecting image: $e');
    }
  }

  // Method to pick an image from the camera
  Future<void> pickImageFromCamera(bool side) async {
    final picker = ImagePicker();
    try {
      final XFile? pickedFile =
          await picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        await cropImage(File(pickedFile.path), side);
        Get.back(); // Close bottom sheet after selection
      } else {
        Navigator.of(Get.context!).pop();
        print('No image selected.');
        _showSnackBar('No image selected.');
      }
    } catch (e) {
      Navigator.of(Get.context!).pop();
      print('Error while selecting image: $e');
      _showSnackBar('Error while selecting image: $e');
    }
  }

  // Method to crop the selected image
  Future<void> cropImage(File imageFile, bool side) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      aspectRatio:
          CropAspectRatio(ratioX: 7, ratioY: 4), // Custom aspect ratio 4:5
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Crop Image',
          toolbarColor:
              AppColor.primaryColor, // Replace with your primary color
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: true, // Lock to prevent changing aspect ratio
        ),
        IOSUiSettings(
          title: 'Crop Image',
          aspectRatioLockEnabled: true, // Lock to prevent changing aspect ratio
        ),
      ],
    );

    if (croppedFile != null) {
      if (side) {
        frontAddharImage.value = File(croppedFile.path);
      } else {
        backAddharImage.value = File(croppedFile.path);
      }
    }
  }

  // Helper method to show a snackbar
  void _showSnackBar(String message) {
    CustomSanckbar.showSnackbar(Get.context!, message, true);
  }
}
