class MyProfileModel {
  Data? data;

  MyProfileModel({this.data});

  MyProfileModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  dynamic firstName;
  dynamic lastName;
  dynamic gender;
  dynamic selfieImg;
  dynamic emailId;
  dynamic mobileNumber;
  dynamic state;
  dynamic city;
  dynamic address;
  dynamic pincode;
  dynamic latitude;
  dynamic longitude;
  dynamic aadhaarNumber;
  dynamic aadharImgFrontSide;
  dynamic aadharImgBackSide;
  dynamic token;
  dynamic accHolderName;
  dynamic accNumber;
  dynamic bankName;
  dynamic ifscCode;
  dynamic bankPassBookImage;
  dynamic fcmTokenAgent;
  dynamic profileCompleted;
  dynamic activeAgent;
  dynamic agentVerified;
  dynamic profileInfoStepFirst;
  dynamic aadharInfoStepSecond;
  dynamic bankInfoStepThird;
  dynamic agentIDPk;

  Data(
      {this.firstName,
      this.lastName,
      this.gender,
      this.selfieImg,
      this.emailId,
      this.mobileNumber,
      this.state,
      this.city,
      this.address,
      this.pincode,
      this.latitude,
      this.longitude,
      this.aadhaarNumber,
      this.aadharImgFrontSide,
      this.aadharImgBackSide,
      this.token,
      this.accHolderName,
      this.accNumber,
      this.bankName,
      this.ifscCode,
      this.bankPassBookImage,
      this.fcmTokenAgent,
      this.profileCompleted,
      this.activeAgent,
      this.agentVerified,
      this.profileInfoStepFirst,
      this.aadharInfoStepSecond,
      this.bankInfoStepThird,
      this.agentIDPk});

  Data.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    gender = json['gender'];
    selfieImg = json['selfieImg'];
    emailId = json['emailId'];
    mobileNumber = json['mobileNumber'];
    state = json['state'];
    city = json['city'];
    address = json['address'];
    pincode = json['pincode'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    aadhaarNumber = json['aadhaarNumber'];
    aadharImgFrontSide = json['aadharImgFrontSide'];
    aadharImgBackSide = json['aadharImgBackSide'];
    token = json['token'];
    accHolderName = json['accHolderName'];
    accNumber = json['accNumber'];
    bankName = json['bankName'];
    ifscCode = json['ifscCode'];
    bankPassBookImage = json['bankPassBookImage'];
    fcmTokenAgent = json['fcmTokenAgent'];
    profileCompleted = json['profileCompleted'];
    activeAgent = json['activeAgent'];
    agentVerified = json['agentVerified'];
    profileInfoStepFirst = json['profileInfoStepFirst'];
    aadharInfoStepSecond = json['aadharInfoStepSecond'];
    bankInfoStepThird = json['bankInfoStepThird'];
    agentIDPk = json['agentIDPk'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['gender'] = this.gender;
    data['selfieImg'] = this.selfieImg;
    data['emailId'] = this.emailId;
    data['mobileNumber'] = this.mobileNumber;
    data['state'] = this.state;
    data['city'] = this.city;
    data['address'] = this.address;
    data['pincode'] = this.pincode;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['aadhaarNumber'] = this.aadhaarNumber;
    data['aadharImgFrontSide'] = this.aadharImgFrontSide;
    data['aadharImgBackSide'] = this.aadharImgBackSide;
    data['token'] = this.token;
    data['accHolderName'] = this.accHolderName;
    data['accNumber'] = this.accNumber;
    data['bankName'] = this.bankName;
    data['ifscCode'] = this.ifscCode;
    data['bankPassBookImage'] = this.bankPassBookImage;
    data['fcmTokenAgent'] = this.fcmTokenAgent;
    data['profileCompleted'] = this.profileCompleted;
    data['activeAgent'] = this.activeAgent;
    data['agentVerified'] = this.agentVerified;
    data['profileInfoStepFirst'] = this.profileInfoStepFirst;
    data['aadharInfoStepSecond'] = this.aadharInfoStepSecond;
    data['bankInfoStepThird'] = this.bankInfoStepThird;
    data['agentIDPk'] = this.agentIDPk;
    return data;
  }
}
