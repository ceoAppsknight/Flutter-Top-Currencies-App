class HttpException implements Exception {
  final _message;

  HttpException([this._message]);

  String toString() {
    if (_message == null) return "Exception";
    return "Exception: $_message";
  }
}
