import 'package:sahakari/views/components/qr_overlay.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrScannerLatest extends StatefulWidget {
  const QrScannerLatest({Key? key}) : super(key: key);

  @override
  State<QrScannerLatest> createState() => QrScannerLatestState();
}

class QrScannerLatestState extends State<QrScannerLatest> {
  String _result = 'Scan a code';
  MobileScannerController _cameraController = MobileScannerController();

  @override
  Widget build(BuildContext context) {
    final _context = MediaQuery.of(context);
    return Scaffold(
        appBar: AppBar(
          // leading: IconButton(
          //   icon: const Icon(Icons.arrow_back, color: Colors.black87),
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          // ),
          title:
              const Text('QR Scanner', style: TextStyle(color: Colors.black54)),
          backgroundColor: Colors.white70,
          elevation: 0,
          actions: [
            IconButton(
              color: Colors.black54,
              icon: ValueListenableBuilder(
                valueListenable: _cameraController.torchState,
                builder: (context, state, child) {
                  switch (state as TorchState) {
                    case TorchState.off:
                      return const Icon(Icons.flash_off, color: Colors.grey);
                    case TorchState.on:
                      return const Icon(Icons.flash_on, color: Colors.yellow);
                  }
                },
              ),
              iconSize: 32.0,
              onPressed: () => _cameraController.toggleTorch(),
            ),
            IconButton(
              color: Colors.black54,
              icon: ValueListenableBuilder(
                valueListenable: _cameraController.cameraFacingState,
                builder: (context, state, child) {
                  switch (state as CameraFacing) {
                    case CameraFacing.front:
                      return const Icon(Icons.camera_front);
                    case CameraFacing.back:
                      return const Icon(Icons.camera_rear);
                  }
                },
              ),
              iconSize: 32.0,
              onPressed: () => _cameraController.switchCamera(),
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              color: Colors.transparent,
              height: _context.size.height * 0.7,
              width: _context.size.width,
              child: Center(
                child: Stack(children: [
                  MobileScanner(
                      allowDuplicates: false,
                      controller: _cameraController,
                      onDetect: (barcode, args) {
                        if (barcode.rawValue == null) {
                          debugPrint('Failed to scan Barcode');
                        } else {
                          final String code = barcode.rawValue!;
                          setState(() {
                            _result = code;
                          });
                          debugPrint('Barcode found! $code');
                        }
                      }),
                  QRScannerOverlay(overlayColour: Colors.black.withOpacity(0.5))
                ]),
              ),
            ),
            Text(_result),
          ],
        ));
  }
}
