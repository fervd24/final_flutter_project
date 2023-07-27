import 'package:flutter/material.dart';
import 'package:flutter_final_project/models/serial_number/id_result.dart';
import 'package:http/http.dart' as http;

class SerialNumberController extends ChangeNotifier {
  bool _isLoading = false;
  IDResult? _idResult;

  bool get isLoading => _isLoading;
  IDResult? get idResult => _idResult;
  

  Future<void> getDataById(String id, BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    //REAL HTTP GET EXMAPLE
    //
    // final url = Uri.https('test.com/$id');
    // try {
    //   final response = await http.get(url);
      
    // } catch (e) {
    //   print(e);
    // }

    Map<String, dynamic> myMockedResponse = {
      "id": "test123",
      "email": "test@gmail.com",
      "firstName": "John",
      "lastName": "Doe",
      "age": 32
    };

    //Navigator.of(context!).pushNamed('/loading');
    await Future.delayed(const Duration(seconds: 2),() {
      _isLoading = false;
      notifyListeners();
    });


    if(id == myMockedResponse['id']){
      _idResult = IDResult.fromMap(myMockedResponse);
      notifyListeners();
    } else {
      _idResult = null;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid id!')),
      );
    }

    return;
  }
}