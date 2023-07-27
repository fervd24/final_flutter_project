import 'package:flutter/material.dart';
import 'package:flutter_final_project/models/qr_scanner/qr_code_result.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScannerController extends ChangeNotifier {


  Barcode? _result;
  QRViewController? _controller;
  QrCodeResult? _scanResult;

  final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');

  QRViewController? get controller => _controller;
  Barcode? get result => _result;
  GlobalKey get qrKey => _qrKey;
  QrCodeResult? get scanResult => _scanResult;

 void onQRViewCreated(QRViewController controller) {

    _controller = controller;
    notifyListeners();
    controller.scannedDataStream.listen((scanData) {
      _result = scanData;
      notifyListeners();
    });
  }

  void setScanResult(QrCodeResult result) async {
    _scanResult = QrCodeResult(
      username: 'user1', 
      password: '12345'
      );

    //Simulating api call
    await Future.delayed(const Duration(seconds: 2));

    print(_scanResult);
    notifyListeners();
  }

  void onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

}