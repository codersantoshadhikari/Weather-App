import 'dart:convert';

import 'package:http/http.dart' as http;

import '../errors/api_errors.dart';

class ApiServices {
  // make get method
  Future<dynamic> get(String url) async {
    var response = await http.get(Uri.parse(url));
    return _response(response);
  }

  dynamic _response(http.Response response) {
    ApiError apiError;
    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body) ?? 'No Data';
      return responseJson;
    } else {
      apiError = ApiError(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}',
          response.statusCode);
      throw apiError;
    }
  }
}
