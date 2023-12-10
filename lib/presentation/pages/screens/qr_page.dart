import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/presentation/blocs/qr_bloc/qr_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class QrPage extends StatefulWidget {
  const QrPage({super.key});

  @override
  State<QrPage> createState() => _QrPageState();
}

class _QrPageState extends State<QrPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'qr');
  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QrBloc, QrState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Center(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(32.0),
                  height: 400,
                  child: QRView(
                    key: qrKey,
                    onQRViewCreated: onQRViewCamera,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(64),
                child: Center(
                  child: state.maybeWhen(
                    success: (url) => InkWell(
                      child: Text(
                        'Scanned Successfully! $url',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      onTap: () async {
                        // ignore: deprecated_member_use
                        await launch(url);
                      },
                    ),
                    orElse: () => const Text(''),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void onQRViewCamera(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      context.read<QrBloc>().add(QrEvent.scan(result: scanData));
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
