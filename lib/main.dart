import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Wifi QRコード生成',
      home: WifiQRCode(),
    );
  }
}

class WifiQRCode extends StatefulWidget {
  const WifiQRCode({super.key});

  @override
  State<WifiQRCode> createState() => _WifiQRCodeState();
}

class _WifiQRCodeState extends State<WifiQRCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wifi QRコード生成'),
      ),
      body: Row(
        children: [
          const Text('SSID'),
          Expanded(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'SSIDを入力して下さい',
                fillColor: Colors.yellow,
                filled: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
