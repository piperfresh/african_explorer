class FailedException implements Exception {
  final String message;

  FailedException(this.message);

  @override
  String toString() {
    return message;
  }
}

