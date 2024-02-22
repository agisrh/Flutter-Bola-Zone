class BaseResponse {
  bool? success;
  int? statusCode;
  String message;
  dynamic baseData;

  BaseResponse({
    this.success = false,
    this.statusCode = 00,
    this.message = "Something wrong",
    this.baseData,
  });

  static BaseResponse fromJson(Map<String, dynamic> json) {
    return BaseResponse(
      success: json["success"],
      message: json["message"],
      statusCode: json["status_code"],
      baseData: json["data"],
    );
  }
}

class KalogError {
  final String field;
  final String value;
  final String reason;

  KalogError(this.field, this.value, this.reason);

  static KalogError fromJson(Map<String, dynamic> json) {
    return KalogError(
      json["field"],
      json["value"],
      json["reason"],
    );
  }
}
