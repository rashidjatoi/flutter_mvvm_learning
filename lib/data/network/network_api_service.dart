import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_mvvm_learning/data/app_exceptions.dart';
import 'package:flutter_mvvm_learning/data/network/base_api_service.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class NetworkApiService extends BaseApiService {
  // Override method for making GET requests
  @override
  Future getGetResponse(String url) async {
    dynamic responseJson;

    try {
      // Making a GET request using the http package
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));

      // Process the response
      responseJson = returnResponse(response);
    } on SocketException {
      // Handling SocketException when there's no internet connection
      throw FetchDataException('No Internet Connection');
    } on TimeoutException {
      // Handling TimeoutException when the request times out
      throw FetchDataException('Request Timeout');
    } on FormatException {
      // Handling FormatException for invalid JSON responses
      throw FetchDataException('Invalid JSON Response');
    } catch (e) {
      // Handling other exceptions and providing a generic error message
      throw FetchDataException('Error: $e');
    }

    return responseJson; // Return the processed response
  }

  // Override method for making POST requests
  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;

    try {
      // Making a POST request using the http package
      Response response = await http
          .post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 10));

      // Process the response
      responseJson = returnResponse(response);
    } on SocketException {
      // Handling SocketException when there's no internet connection
      throw FetchDataException('No Internet Connection');
    } on TimeoutException {
      // Handling TimeoutException when the request times out
      throw FetchDataException('Request Timeout');
    } on FormatException {
      // Handling FormatException for invalid JSON responses
      throw FetchDataException('Invalid JSON Response');
    } catch (e) {
      // Handling other exceptions and providing a generic error message
      throw FetchDataException('Error: $e');
    }

    return responseJson; // Return the processed response
  }

  // Method to handle different HTTP response statuses
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        // Handling a successful response (status code 200) by decoding the JSON
        dynamic responseJson = jsonDecode(response.body);
        return responseJson; // Return the decoded JSON
      case 400:
        // Handling a status code 400 (Bad Request) by throwing a BadRequestException
        throw BadRequestException(response.body.toString());
      case 404:
        // Handling a status code 404 (Not Found) by throwing an UnAuthorisedException
        throw UnAuthorisedException(response.body.toString());
      default:
        // Handling other status codes by throwing a FetchDataException with a generic error message
        throw FetchDataException(
            'Error Occurred while communicating with server with status code ${response.statusCode}');
    }
  }
}
