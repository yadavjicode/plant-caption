class VerifyOtpModel {
  Data? data;
  String? message;

  VerifyOtpModel({this.data, this.message});

  VerifyOtpModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String? token;
  bool? isBankInfoStepThird;
  bool? isAadharInfoStepSecond;
  bool? isProfileCompleted;
  bool? isProfileInfoStepFirst;

  Data(
      {this.token,
      this.isBankInfoStepThird,
      this.isAadharInfoStepSecond,
      this.isProfileCompleted,
      this.isProfileInfoStepFirst});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    isBankInfoStepThird = json['isBankInfoStepThird'];
    isAadharInfoStepSecond = json['isAadharInfoStepSecond'];
    isProfileCompleted = json['isProfileCompleted'];
    isProfileInfoStepFirst = json['isProfileInfoStepFirst'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['isBankInfoStepThird'] = this.isBankInfoStepThird;
    data['isAadharInfoStepSecond'] = this.isAadharInfoStepSecond;
    data['isProfileCompleted'] = this.isProfileCompleted;
    data['isProfileInfoStepFirst'] = this.isProfileInfoStepFirst;
    return data;
  }
}
