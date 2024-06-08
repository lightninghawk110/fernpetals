

class SuccessResponse {
  String responseCode;
  List<Datum>? data;
 List<ErrorData>? errorData;

  SuccessResponse({
    required this.responseCode,
    this.data,
    this.errorData,
  });

factory SuccessResponse.fromJson(Map<String, dynamic> json) {
    String responseCode = json['RESPONSE_CODE'];
    if (responseCode.startsWith("2")) {
      return SuccessResponse(
        responseCode: responseCode,
        data: List<Datum>.from(json["DATA"].map((x) => Datum.fromJson(x))),
      );
    } else if (responseCode.startsWith("5")) {
      return SuccessResponse(
        responseCode: responseCode,
        errorData: List<ErrorData>.from(json["DATA"].map((x) => ErrorData.fromJson(x))),
      );
    } else {
      // Handle other cases if needed
      return SuccessResponse(
        responseCode: responseCode,
      );
    }
  }
}


class Datum {
  String uuid;
  String uid;
  String firstName;
  String lastName;
  String email;
  String mobile;
  dynamic referralId;
  dynamic profilePicUrl;
  String isEmailActivated;
  String isMobileNoActivated;
  dynamic state;
  dynamic gender;
  dynamic occupation;
  dynamic country;
  dynamic whatsappNumber;

  Datum({
    required this.uuid,
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobile,
    required this.referralId,
    required this.profilePicUrl,
    required this.isEmailActivated,
    required this.isMobileNoActivated,
    required this.state,
    required this.gender,
    required this.occupation,
    required this.country,
    required this.whatsappNumber,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        uuid: json["uuid"],
        uid: json["uid"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        mobile: json["mobile"],
        referralId: json["referral_id"],
        profilePicUrl: json["profile_pic_url"],
        isEmailActivated: json["is_email_activated"],
        isMobileNoActivated: json["is_mobile_no_activated"],
        state: json["state"],
        gender: json["gender"],
        occupation: json["occupation"],
        country: json["country"],
        whatsappNumber: json["whatsapp_number"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "uid": uid,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "mobile": mobile,
        "referral_id": referralId,
        "profile_pic_url": profilePicUrl,
        "is_email_activated": isEmailActivated,
        "is_mobile_no_activated": isMobileNoActivated,
        "state": state,
        "gender": gender,
        "occupation": occupation,
        "country": country,
        "whatsapp_number": whatsappNumber,
      };
}

class ErrorData {
  String message;
  ErrorData({required this.message});

  factory ErrorData.fromJson(Map<String, dynamic> json) => ErrorData(
        message: json["message"],
      );
}