import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:idealista/app/api_service/api_constants.dart';
import 'package:idealista/app/model/profile_info_model.dart';
import 'package:idealista/app/model/send_otp_model.dart';
import 'package:idealista/app/model/verify_otp_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
// Start send otp api ===============================================================================>
  Future<SendOtpModel> sendOtp(String mobileNo) async {
    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.sendOtpUrl}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'mobileNumber': mobileNo,
      }),
    );

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      return SendOtpModel.fromJson(responseJson);
    } else {
      final responseJson = json.decode(response.body);
      throw Exception('Failed: ${responseJson['message']}');
    }
  }
// End send otp api ===================================================================================>

// Start verify otp api ===============================================================================>
  Future<VerifyOtpModel> verifyOtp(String mobileNo, String otp) async {
    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.verifyOtpUrl}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'mobileNumber': mobileNo, "otp": otp}),
    );

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      return VerifyOtpModel.fromJson(responseJson);
    } else {
      final responseJson = json.decode(response.body);
      throw Exception('Failed: ${responseJson['message']}');
    }
  }

// End verify otp api ===================================================================================>

// Start profile info agent api =====================================================================>
  Future<ProfileInfoModel> profileInfoAgent(
      String firstName,
      String lastName,
      String gender,
      String emailId,
      String mobileNumber,
      String address,
      String city,
      String state,
      String pincode,
      File selfieImg
      ) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    // Prepare form data for multipart request
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.profileInfoUrl}'),
    );

    // Add headers
    request.headers.addAll({
      'Content-Type': 'application/json', // Content-Type for the whole request
      'Authorization':
          'Bearer $token', // Replace with the actual token if needed
    });

    // Add the image file
    request.files.add(await http.MultipartFile.fromPath(
      'selfieImg',
      selfieImg.path,
      contentType:
          MediaType('image', 'jpeg'), // Or 'png' depending on the image type
    ));

    // Prepare agent details as a JSON
    request.fields['agentPersonalDetails'] = jsonEncode({
      "agentPersonalDetails": {
        "firstName": firstName,
        "lastName": lastName,
        "gender": gender,
        "emailId": emailId,
        "mobileNumber": mobileNumber,
        "state": state,
        "city": city,
        "address": address,
        "pincode": pincode,
        "latitude": "", // Optional
        "longitude": "", // Optional
        "fcmtoken": "" // Optional
      }
    });

    try {
      // Send the request
      final response = await request.send();

      // If the server responds with status code 200 (OK)
      if (response.statusCode == 200) {
        // Parse the response body
        final responseBody = await response.stream.bytesToString();
        final responseJson = json.decode(responseBody);
        print(responseJson);

        // Return the parsed response as ProfileInfoAgentModel
        return ProfileInfoModel.fromJson(responseJson);
      } else {
        // If something goes wrong, throw an exception
        final responseBody = await response.stream.bytesToString();
        final responseJson = json.decode(responseBody);
        throw Exception('Failed: ${responseJson['message']}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
  // End profile info agent api =====================================================================>
}
