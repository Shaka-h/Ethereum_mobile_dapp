import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:reown_appkit/reown_appkit.dart';

class WalletConnect extends StatefulWidget {
  const WalletConnect({super.key});

  @override
  State<WalletConnect> createState() => _WalletConnectState();
}

class _WalletConnectState extends State<WalletConnect> {
  final appKit = ReownAppKit.createInstance(
    projectId: 'ee01a378b0160df89c09e750237d4c21',
    metadata: const PairingMetadata(
      name: 'MobileDAPP',
      description: 'Example app description',
      url: 'https://example.com/',
      icons: ['https://example.com/logo.png'],
      redirect: Redirect(
        native: 'exampleapp://',
        universal: 'https://reown.com/exampleapp',
      ),
    ),
  );
  bool initialized = false;
  late final _appKitModal;
  initwalletKit() async {
// Register here the event callbacks on the service you'd like to use. See `Events` section.
    _appKitModal = ReownAppKitModal(
      context: context,
      appKit: await appKit,
    );

    await _appKitModal.init();
    initialized = true;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initwalletKit();
  }

  @override
  Widget build(BuildContext context) {
    Logger.level.value;
    return Scaffold(
      body: Center(
        child: initialized
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppKitModalConnectButton(appKit: _appKitModal),
                  AppKitModalNetworkSelectButton(appKit: _appKitModal),
                  AppKitModalAccountButton(appKit: _appKitModal)
                ],
              )
            : Center(child: CircularProgressIndicator.adaptive()),
      ),
    );
  }
}
