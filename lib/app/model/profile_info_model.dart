class ProfileInfoModel {
  String? message;
  bool? isProfileInfoStepFirst;

  ProfileInfoModel({this.message, this.isProfileInfoStepFirst});

  ProfileInfoModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    isProfileInfoStepFirst = json['isProfileInfoStepFirst'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['isProfileInfoStepFirst'] = this.isProfileInfoStepFirst;
    return data;
  }
}
