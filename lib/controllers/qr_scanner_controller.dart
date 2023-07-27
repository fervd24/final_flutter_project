import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScannerController extends ChangeNotifier {


  Barcode? _result;
  QRViewController? _controller;
  final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');

  QRViewController? get controller => _controller;
  Barcode? get result => _result;
  GlobalKey get qrKey => _qrKey;

 void onQRViewCreated(QRViewController controller) {

    _controller = controller;
    notifyListeners();
    controller.scannedDataStream.listen((scanData) {
      _result = scanData;
      notifyListeners();
    });
  }

  void onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

}