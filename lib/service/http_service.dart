import 'dart:developer';
import 'package:http/http.dart' as http;

class HttpService {
  static final baseURL = "https://api.dictionaryapi.dev/api/v2/entries/";

  static Future<http.Response> getRequest(endPoint) async {
    //  default value of null
    http.Response? httpResponse;

    try {
      httpResponse = await http.get(
          Uri.parse("$baseURL$endPoint")); 
    } on Exception catch (e) {
      log(e.toString());
    }

    if (httpResponse == null) {
      return http.Response('Error: Unable to fetch data', 500);
    }

    return httpResponse;
  }
}


