import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
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
  final ssidController = TextEditingController();
  final passwordController = TextEditingController();

  String get wifiCode =>
      'WIFI:S:${ssidController.text};T:WPA;P:${passwordController.text};;';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wifi QRコード作成アプリ'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 80,
                      child: Text('SSID'),
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'SSIDを入力して下さい',
                          fillColor: Colors.yellow,
                          filled: true,
                        ),
                        controller: ssidController,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 80,
                      child: Text('パスワード'),
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'パスワードを入力して下さい',
                          fillColor: Colors.yellow,
                          filled: true,
                        ),
                        controller: passwordController,
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
              onPressed: () {
                setState(() {});
              },
              child: const Text('QRコードを作成します'),
            ),
          ),
          if (ssidController.text.isEmpty || passwordController.text.isEmpty)
            Image.asset('images/wifi_icon.jpeg')
          else
            QrImage(
              data: wifiCode,
              size: 200,
            )
        ],
      ),
    );
  }
}
