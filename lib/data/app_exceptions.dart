class AppException implements Exception {
  final String? _message; // Holds the message for the exception
  final String? _prefix; // Holds the prefix for the exception

  // Constructor for AppException, taking optional message and prefix parameters
  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return "$_message $_prefix"; // Returns the concatenated message and prefix
  }
}

class FetchDataException extends AppException {
  // Constructor for FetchDataException, inherits from AppException
  FetchDataException([String? message])
      : super(message,
            "Error During Communication"); // Passes message and prefix to the superclass constructor
}

class BadRequestException extends AppException {
  // Constructor for BadRequestException, inherits from AppException
  BadRequestException([String? message]) : super(message, "Invalid Request");
  // Passes message and prefix to the superclass constructor
}

class UnAuthorisedException extends AppException {
  // Constructor for UnAuthorisedException, inherits from AppException
  UnAuthorisedException([String? message])
      : super(message, "UnAuthorised Request");
  // Passes message and prefix to the superclass constructor
}

class InvalidInputException extends AppException {
  // Constructor for InvalidInputException, inherits from AppException
  InvalidInputException([String? message])
      : super(message, "Invalid Input Request");
  // Passes message and prefix to the superclass constructor
}
