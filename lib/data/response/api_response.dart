// Importing the status enumeration from the 'status.dart' file
import 'package:flutter_mvvm_learning/data/response/status.dart';

// A generic class ApiResponse with type parameter T
class ApiResponse<T> {
  // Properties to hold status, data, and message, all nullable
  Status? status;
  T? data;
  String? message;

  // Constructor with named parameters to initialize status, data, and message
  ApiResponse({this.status, this.data, this.message});

  // Constructor to create an ApiResponse object representing loading state
  ApiResponse.loading() : status = Status.LOADING;

  // Constructor to create an ApiResponse object representing completed state
  ApiResponse.completed() : status = Status.COMPLETED;

  // Constructor to create an ApiResponse object representing error state
  ApiResponse.error() : status = Status.ERROR;

  // Overriding the toString() method to provide a formatted string representation of ApiResponse
  @override
  String toString() =>
      'ApiResponse(Status: $status, Data: $data, Message: $message)';
}
