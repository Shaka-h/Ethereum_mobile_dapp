import 'package:ethereum_mobile_dapp/walletConnect.dart';
import 'package:flutter/material.dart';


Future<void> main() async {
  // await RustLib.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WalletConnect()
    );
  }
}
