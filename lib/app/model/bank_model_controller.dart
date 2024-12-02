class BankDetailsModel {
  bool? isBankInfoStepThird;
  String? message;

  BankDetailsModel({this.isBankInfoStepThird, this.message});

  BankDetailsModel.fromJson(Map<String, dynamic> json) {
    isBankInfoStepThird = json['isBankInfoStepThird'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isBankInfoStepThird'] = this.isBankInfoStepThird;
    data['message'] = this.message;
    return data;
  }
}
