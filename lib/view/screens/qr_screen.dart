
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_final_project/controllers/qr_scanner_controller.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScannerScreen extends StatefulWidget {
  const QRScannerScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  Barcode? result;
  QRViewController? controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    final qrController = Provider.of<QRScannerController>(context);
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(flex: 4, child: QRView(
            key: qrController.qrKey,
            onQRViewCreated: _onQRViewCreated,
            overlay: QrScannerOverlayShape(
                borderColor: Colors.red,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: scanArea),
            onPermissionSet: (ctrl, p) => qrController.onPermissionSet(context, ctrl, p),
          )),
          Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  if (result != null)
                    Text(
                        'Barcode Type:    Data: ${result!.code}')
                  else
                    const Text('Scan a code'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                            onPressed: () async {
                              await controller?.toggleFlash();
                              setState(() {});
                            },
                            child: FutureBuilder(
                              future: controller?.getFlashStatus(),
                              builder: (context, snapshot) {
                                return Text('Flash: ${snapshot.data}');
                              },
                            )),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                            onPressed: () async {
                              await controller?.flipCamera();
                              setState(() {});
                            },
                            child: FutureBuilder(
                              future: controller?.getCameraInfo(),
                              builder: (context, snapshot) {
                                if (snapshot.data != null) {
                                  return const Text('Camera facing ');
                                } else {
                                  return const Text('loading');
                                }
                              },
                            )),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }


  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}


//TODO: op2
// class QRScannerScreen extends StatefulWidget {
//   const QRScannerScreen({Key? key}) : super(key: key);

//   @override
//   State<StatefulWidget> createState() => _QRScannerScreenState();
// }

// class _QRScannerScreenState extends State<QRScannerScreen> {

//   @override
//   Widget build(BuildContext context) {
//     final qrScannerController = Provider.of<QRScannerController>(context);
//     final controller = qrScannerController.controller;
//     final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');
 
//     @override
//     void reassemble() {
//       super.reassemble();
//       if (Platform.isAndroid) {
//         controller!.pauseCamera();
//       } else if (Platform.isIOS) {
//         controller!.resumeCamera();
//       }
//     }

//     @override
//     void dispose() {
//       controller?.dispose();
//       super.dispose();
//     }
//     var scanArea = (MediaQuery.of(context).size.width < 400 ||
//             MediaQuery.of(context).size.height < 400)
//         ? 150.0
//         : 300.0;
//     return Scaffold(
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             flex: 4, 
//             child: QRView(
//               key: _qrKey,
//               onQRViewCreated: qrScannerController.onQRViewCreated,
//               overlay: QrScannerOverlayShape(
//                   borderColor: Colors.red,
//                   borderRadius: 10,
//                   borderLength: 30,
//                   borderWidth: 10,
//                   cutOutSize: scanArea),
//               //onPermissionSet: (ctrl, p) => qrScannerController.onPermissionSet(context, ctrl, p),
//               )
//             ),
//           Expanded(
//             flex: 1,
//             child: FittedBox(
//               fit: BoxFit.contain,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: <Widget>[
//                   if (qrScannerController.result != null)
//                     Text('Barcode Type:   Data: ${qrScannerController.result!.code}')
//                   else
//                     const Text('Scan a code'),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: <Widget>[
//                       Container(
//                         margin: const EdgeInsets.all(8),
//                         child: ElevatedButton(
//                             onPressed: () async => await controller?.toggleFlash(),
//                             child: FutureBuilder(
//                               future: controller?.getFlashStatus(),
//                               builder: (context, snapshot) {
//                                 return Text('Flash: ${snapshot.data}');
//                               },
//                             )),
//                       ),
//                       Container(
//                         margin: const EdgeInsets.all(8),
//                         child: ElevatedButton(
//                             onPressed: () async => await controller?.flipCamera(),
//                             child: FutureBuilder(
//                               future: controller?.getCameraInfo(),
//                               builder: (context, snapshot) {
//                                 if (snapshot.data != null) {
//                                   return const Text('Camera facing ');
//                                 } else {
//                                   return const Text('loading');
//                                 }
//                               },
//                             )),
//                       )
//                     ],
//                   ),
//                   ElevatedButton(
//                     onPressed: () => Navigator.of(context).pushReplacementNamed('/menu'), 
//                     child: const Text('return'))
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }