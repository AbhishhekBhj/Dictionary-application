import 'dart:developer';
import 'dart:io';

import 'package:dictionary/model/dictionary_response_model.dart';
import 'package:dictionary/service/http_service.dart';

class DictionaryRepository {
  Future<List<DictionaryResponse>> getDictionaryResponse(String word) async {
    try {
      final response = await HttpService.getRequest("en_US/$word");

      if (response.statusCode >= 200 && response.statusCode <= 300) {
        final ourResult = dictionaryResponseFromJson(response.body);
        return ourResult;
      } else {
        return []; //return empty list
      }
    } on Exception catch (e) {
      log(e.toString());
      return []; //return empty list
    }
  }
}
