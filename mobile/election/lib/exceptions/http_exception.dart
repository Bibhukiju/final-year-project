class HttpException implements Exception {
  final String exceptionMessage;

  HttpException({required this.exceptionMessage});

  @override
  String toString() {
    return exceptionMessage;
  }
}
