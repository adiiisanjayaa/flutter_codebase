class ApiException implements Exception {
  String message;
  dynamic response;

  ApiException(this.response) : message = response["message"] ?? "Something Went Wrong";

  @override
  String toString() => message;
}