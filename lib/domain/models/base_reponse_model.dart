class BaseResponseModel<T> {
  final bool isSuccess;
  final int? statusCode;
  final String message;
  final T? data;

  BaseResponseModel({
    required this.isSuccess,
    required this.statusCode,
    required this.message,
    this.data,
  });

  factory BaseResponseModel.fromJson(Map<String, dynamic> json, T Function(dynamic)? fromJson) {
    final bool success = json["status"] == true || json["success"] == true;

    return BaseResponseModel<T>(
      isSuccess: success,
      statusCode: json["statusCode"] ?? json["code"] ?? 200,
      message: json["message"]?.toString() ?? (success ? "Success" : "Error"),
      data: success
          ? (fromJson != null ? fromJson(json["data"]) : json["data"] as T?)
          : null,
    );
  }

  @override
  String toString() => "BaseResponseModel(isSuccess: $isSuccess, statusCode: $statusCode, message: $message, data: $data)";
}
