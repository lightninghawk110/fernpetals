class ErrorResponse {
  String responseCode;
  List<Message> data;

  ErrorResponse({
    required this.responseCode,
    required this.data,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
        responseCode: json["RESPONSE_CODE"],
        data: List<Message>.from(json["DATA"].map((x) => Message.fromJson(x))),
      );
}

class Message {
  String message;

  Message({
    required this.message,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        message: json["message"],
      );
}