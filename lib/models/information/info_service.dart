

import 'package:flutter_final_project/models/information/info_model.dart';

class InfoService {
  static Future<InfoModel?> fetchInfo() async {
    Map<String, dynamic>responseData = {
      "brand": "iphone",
      "model": "14 pro max",
      "serial": "22-12-mm-e4-000"
    };

    await Future.delayed(const Duration(seconds: 3));

    return InfoModel.fromJson(responseData);
  }
}