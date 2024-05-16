class ResponseModel {
  final String responseCode;

  ResponseModel({required this.responseCode});

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      responseCode: json['RESPONSE_CODE'],
    );
  }
}
