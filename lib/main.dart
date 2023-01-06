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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const SizedBox(width: 80, child: Text('SSID')),
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
                Row(
                  children: [
                    const SizedBox(width: 80, child: Text('パスワード')),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'パスワードを入力して下さい',
                          fillColor: Colors.yellow,
                          filled: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('QRコードを作成します'),
            ),
          ),
          Image.asset('images/wifi_icon.jpeg'),
        ],
      ),
    );
  }
}
