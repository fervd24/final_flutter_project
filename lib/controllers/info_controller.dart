import 'package:flutter/material.dart';
import 'package:flutter_final_project/models/information/info_model.dart';
import 'package:flutter_final_project/models/information/info_service.dart';

class InfoController extends ChangeNotifier {

  InfoModel? _infoModel;

  InfoModel? get infoModel => _infoModel;
  
  Future<void> getData() async {
    final response = await InfoService.fetchInfo();

    _infoModel = response;
    notifyListeners();
  }
}