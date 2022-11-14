import 'dart:math';
import 'package:logger/logger.dart';
import 'package:sahakari/common/routes/routes.dart';
import 'package:sahakari/views/components/qr_overlay.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:visibility_aware_state/visibility_aware_state.dart';
import 'package:visibility_detector/visibility_detector.dart';

final log = Logger(printer: PrettyPrinter());

class QrScannerLatest extends StatefulWidget {
  QrScannerLatest({Key? key}) : super(key: key) {
    log.d("QrScanner constructor");
  }

  @override
  State<QrScannerLatest> createState() => QrScannerLatestState();
}

class QrScannerLatestState extends VisibilityAwareState<QrScannerLatest> {
  String _result = 'Scan a code';
  late MobileScannerController _cameraController;

  @override
  void initState() {
    super.initState();
    debugPrint("[QR Scanner Latest] Init State");
    _cameraController = MobileScannerController();
    _cameraController.start();
  }

  @override
  void dispose() {
    debugPrint("[Disposed QrScannerLatest]");
    _cameraController.stop();
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _context = MediaQuery.of(context);
    // final _isCurrentScreen = ModalRoute.of(context)?.isCurrent;
    return Scaffold(
        appBar: AppBar(
          // leading: IconButton(
          //   icon: const Icon(Icons.arrow_back, color: Colors.black87),
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          // ),
          title: Text(
            'QR Scanner',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).primaryColorDark),
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          actions: [
            IconButton(
              color: Theme.of(context).primaryColorDark,
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
              color: Theme.of(context).primaryColorDark,
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
              color: Theme.of(context).scaffoldBackgroundColor,
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
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                width: _context.size.width,
                // alignment: Alignment.center,s
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_result,
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).primaryColorDark)),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
