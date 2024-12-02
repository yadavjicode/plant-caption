class AadhaarDetailsModel {
  bool? isAadharInfoStepSecond;
  String? message;

  AadhaarDetailsModel({this.isAadharInfoStepSecond, this.message});

  AadhaarDetailsModel.fromJson(Map<String, dynamic> json) {
    isAadharInfoStepSecond = json['isAadharInfoStepSecond'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isAadharInfoStepSecond'] = this.isAadharInfoStepSecond;
    data['message'] = this.message;
    return data;
  }
}
