class NetworkException implements Exception {
  String message;
  String exceptionType;

  NetworkException(this.message, {this.exceptionType = 'None'});

  @override
  String toString() => message;
}