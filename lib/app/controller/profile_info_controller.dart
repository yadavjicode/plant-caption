import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idealista/app/api_service/api_service.dart';
import 'package:idealista/app/constant/app_color.dart';
import 'package:idealista/app/model/send_otp_model.dart';
import 'package:idealista/app/ui/widget/CustomSnackbar.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

// class ProfileInfoController extends GetxController {
//   final ApiService apiService = ApiService();
//   SendOtpModel? _member;
//   var isLoading = false.obs;
//   String? _error;
//   File? selectedImages;
//   SendOtpModel? get member => _member;
//   String? get error => _error;
//   // final ConnectivityService connectivityService =
//   //     Get.put(ConnectivityService());

//   // Future<void> sendOtp(BuildContext context, String phoneno) async {
//   //   isLoading.value = true;
//   //   _error = null;
//   //   notifyListeners();

//   //   try {
//   //     _member = await apiService.sendOtp("+91${phoneno}");

//   //     print('${_member?.message}');

//   //     // ignore: use_build_context_synchronously
//   //     CustomSanckbar.showSnackbar(context, member?.message ?? "", true);
//   //     // Get.off(() => OTPScreen(mobileNumber: phoneEmail));

//   //     print("success");
//   //   } catch (e) {
//   //     _error = e.toString();
//   //     print(_error);
//   //     // if (!connectivityService.isConnected.value) {
//   //     //   CustomSanckbar.showSnackbar(context, "No internet connection!", false);
//   //     // } else {
//   //     CustomSanckbar.showSnackbar(
//   //         context,
//   //         "Something went wrong while fetching data. Please try again later!",
//   //         false);
//   //     // }
//   //   } finally {
//   //     isLoading.value = false;
//   //     notifyListeners();
//   //   }
//   // }

//   // Method to crop and add the image to the selectedImages list
//   Future<void> cropAndAddImage(File imageFile) async {
//     final croppedFile = await ImageCropper().cropImage(
//       sourcePath: imageFile.path,
//       aspectRatio: CropAspectRatio(ratioX: 4, ratioY: 4),
//       uiSettings: [
//         AndroidUiSettings(
//           toolbarTitle: 'Crop Image',
//           toolbarColor: AppColor.primaryColor,
//           toolbarWidgetColor: Colors.white,
//           initAspectRatio: CropAspectRatioPreset.original,
//           lockAspectRatio: true,
//         ),
//         IOSUiSettings(
//           title: 'Crop Image',
//           aspectRatioLockEnabled: true,
//         ),
//       ],
//     );

//     if (croppedFile != null) {
//       selectedImages = File(croppedFile.path);
//     } else {
//       print('Image cropping canceled.');
//       ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
//         content: Text('Image cropping canceled.'),
//       ));
//     }
//   }
// }

class ProfileInfoController extends GetxController {
  var isLoading = false.obs;
  var selectedImage = Rx<File?>(null);
  // // Method to handle the complete profile update process

  // Method to pick an image from the gallery
  Future<void> pickImageFromGallery() async {
    final picker = ImagePicker();
    try {
      final XFile? pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 100,
        maxHeight: 1000,
        maxWidth: 1000,
      );

      if (pickedFile != null) {
        await cropImage(File(pickedFile.path));
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
  Future<void> pickImageFromCamera() async {
    final picker = ImagePicker();
    try {
      final XFile? pickedFile =
          await picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        await cropImage(File(pickedFile.path));
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
  Future<void> cropImage(File imageFile) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      aspectRatio:
          CropAspectRatio(ratioX: 4, ratioY: 4), // Custom aspect ratio 4:5
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
      selectedImage.value = File(croppedFile.path);
    }
  }

  // Helper method to show a snackbar
  void _showSnackBar(String message) {
    CustomSanckbar.showSnackbar(Get.context!, message, true);
  }
}
