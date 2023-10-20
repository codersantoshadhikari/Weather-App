

class ApiError extends Error {
  final String message;
  final int statusCode;

  ApiError(this.message, this.statusCode);

  @override
  String toString() {
    return 'ApiError{message: $message, statusCode: $statusCode}';
  }
}
