import 'dart:convert';

ResponseApi responseApiFromJson(String str) =>
    ResponseApi.fromJson(json.decode(str));

String responseApiToJson(ResponseApi data) => json.encode(data.toJson());

class ResponseApi {
  late String message;
  late String error;
  late bool succes;
  late dynamic data;

  ResponseApi({
    required this.message,
    required this.error,
    required this.succes,
    required this.data,
  });

  ResponseApi.fromJson(Map<String, dynamic> json) {
    message = json["message"];
    error = json["error"];
    succes = json["succes"];

    try {
      data = json['data'];
    } catch (e) {
      print('Exception data $e');
    }
  }

  Map<String, dynamic> toJson() => {
        "message": message,
        "error": error,
        "succes": succes,
        "data": data,
      };
}
