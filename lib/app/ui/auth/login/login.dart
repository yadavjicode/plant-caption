import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idealista/app/const/CustomTextFeild.dart';
import 'package:idealista/app/const/addColor.dart';
import 'package:idealista/app/ui/widget/CustomSnackbar.dart';

import '../../../const/button_constant.dart';
import '../../../const/font_constant.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController phoneno = TextEditingController();
  final TextEditingController _firstController = TextEditingController();
  final TextEditingController _secondController = TextEditingController();
  final TextEditingController _thirdController = TextEditingController();
  final TextEditingController _fourthController = TextEditingController();
  final TextEditingController _fifthController = TextEditingController();
  final TextEditingController _sixthController = TextEditingController();

  final FocusNode _firstFocusNode = FocusNode();
  final FocusNode _secondFocusNode = FocusNode();
  final FocusNode _thirdFocusNode = FocusNode();
  final FocusNode _fourthFocusNode = FocusNode();
  final FocusNode _fifthFocusNode = FocusNode();
  final FocusNode _sixthFocusNode = FocusNode();

  @override
  void dispose() {
    phoneno.dispose();
    _firstController.dispose();
    _secondController.dispose();
    _thirdController.dispose();
    _fourthController.dispose();
    _fifthController.dispose();
    _sixthController.dispose();
    _firstFocusNode.dispose();
    _secondFocusNode.dispose();
    _thirdFocusNode.dispose();
    _fourthFocusNode.dispose();
    _fifthFocusNode.dispose();
    _sixthFocusNode.dispose();
    super.dispose();
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled:
          true, // Allow the bottom sheet to expand over the keyboard
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context)
                .viewInsets
                .bottom, // Padding to move content above keyboard
            left: 20,
            right: 20,
            top: 20,
          ),
          child: SingleChildScrollView(
            // Allows the bottom sheet to be scrolled if necessary
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text(
                  "Enter 6 Digit Code",
                  style: TextStyle(fontSize: 25),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                  child: const Text(
                    "Enter the 6-digit code received on\nyour mobile number",
                    textAlign: TextAlign.center,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _firstOtpField(context),
                    _buildOtpField(context, _secondController, _secondFocusNode,
                        _thirdFocusNode),
                    _buildOtpField(context, _thirdController, _thirdFocusNode,
                        _fourthFocusNode),
                    _buildOtpField(context, _fourthController, _fourthFocusNode,
                        _fifthFocusNode),
                    _buildOtpField(context, _fifthController, _fifthFocusNode,
                        _sixthFocusNode),
                    _lastOtpField(context),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Text(
                    "Resend otp",
                    style: FontConstant.styleSemiBold(
                        fontSize: 12, color: AddColor.darkgrey),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                  width: double.infinity,
                  child: CustomButton(
                    text: "Continue",
                    color: AddColor.primaryColor,
                    textStyle: FontConstant.styleSemiBold(
                      fontSize: 18,
                      color: AddColor.whiteColor,
                    ),
                    onPressed: () {
                      if (_firstController.text.isNotEmpty &&
                          _secondController.text.isNotEmpty &&
                          _thirdController.text.isNotEmpty &&
                          _fourthController.text.isNotEmpty &&
                          _fifthController.text.isNotEmpty &&
                          _sixthController.text.isNotEmpty) {
                        Get.toNamed('/registration');
                      } else {
                        CustomSanckbar.showSnackbar(context, "Enter valid OTP");
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AddColor.whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Image.asset("assets/images/logo.jpeg"),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 30),
                child: Text(
                  "Login or Create an Account",
                  style: FontConstant.styleMedium(
                      fontSize: 20, color: AddColor.blackColor),
                ),
              ),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: CustomTextField(
                    keyboardType: TextInputType.number,
                    maxlength: 10,
                    controller: phoneno,
                    labelText: "Mobile No",
                    hintText: "Mobile no",
                  )),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                      color: AddColor.primaryColor,
                      textStyle: FontConstant.styleSemiBold(
                          fontSize: 18, color: AddColor.whiteColor),
                      text: "Send OTP",
                      onPressed: () => {
                            if (phoneno.text.isEmpty)
                              {
                                CustomSanckbar.showSnackbar(
                                    context, "Mobile no is empty")
                              }
                            else if (phoneno.text.length < 10)
                              {
                                CustomSanckbar.showSnackbar(
                                    context, "Fill 10 digit mobile no")
                              }
                            else
                              {_showBottomSheet(context)}
                          })),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  "OTP will send on your mobile no which\nyou enter above",
                  textAlign: TextAlign.center,
                  style: FontConstant.styleRegular(
                      fontSize: 12, color: AddColor.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOtpField(BuildContext context, TextEditingController controller,
      FocusNode currentFocus, FocusNode? nextFocus) {
    return Container(
      width: 40,
      margin: EdgeInsets.all(3),
      child: TextField(
        controller: controller,
        focusNode: currentFocus,
        decoration: InputDecoration(
          counterText: '',
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        onChanged: (value) {
          if (value.length == 1 && nextFocus != null) {
            FocusScope.of(context).requestFocus(nextFocus);
          } else if (value.length == 0) {
            FocusScope.of(context).previousFocus();
          }
        },
      ),
    );
  }

  Widget _firstOtpField(BuildContext context) {
    return Container(
      width: 40,
      margin: EdgeInsets.all(3),
      child: TextField(
        controller: _firstController,
        focusNode: _firstFocusNode,
        decoration: InputDecoration(
          counterText: '',
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).requestFocus(_secondFocusNode);
          }
        },
      ),
    );
  }

  Widget _lastOtpField(BuildContext context) {
    return Container(
      width: 40,
      margin: const EdgeInsets.all(3),
      child: TextField(
        controller: _sixthController,
        focusNode: _sixthFocusNode,
        obscureText: false,
        decoration: const InputDecoration(
          counterText: '',
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        onChanged: (value) {
          if (value.length == 0) {
            FocusScope.of(context).requestFocus(_fifthFocusNode);
          }
        },
      ),
    );
  }
}
