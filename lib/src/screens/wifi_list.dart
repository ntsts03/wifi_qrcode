import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:wifi_qrcode/main.dart';

class WifiList extends StatefulWidget {
  const WifiList({
    super.key,
  });

  @override
  State<WifiList> createState() => _WifiListState();
}

class _WifiListState extends State<WifiList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('保存されたWiFi'),
      ),
      body: ListView.builder(
        itemCount: box.values.length,
        itemBuilder: (context, index) {
          final value = box.values.toList()[index] as List;
          return WifiTile(
            ssid: value[0],
            password: value[1],
            onPressedQrCode: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ListQrPage(
                          ssid: value[0],
                          password: value[1],
                        )),
              );
              await box.get(value[0]);
              setState(() {});
              print(value[0]);
            },
            onPressedDelete: () async {
              await box.delete(value[0]);
              setState(() {});
              print(box.values);
            },
          );
        },
      ),
    );
  }
}

class WifiTile extends StatelessWidget {
  const WifiTile({
    Key? key,
    required this.ssid,
    required this.password,
    required this.onPressedQrCode,
    required this.onPressedDelete,
  }) : super(key: key);
  final String ssid;
  final String password;
  final Function() onPressedQrCode;
  final Function() onPressedDelete;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    const Text(
                      'SSID',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 43),
                    Expanded(
                      child: Text(ssid),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'パスワード',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Text(password),
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onPressedQrCode,
            icon: const Icon(Icons.qr_code),
          ),
          const SizedBox(width: 40),
          IconButton(
            onPressed: onPressedDelete,
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}

class ListQrPage extends StatelessWidget {
  const ListQrPage({
    super.key,
    required this.ssid,
    required this.password,
  });
  final String ssid;
  final String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: QrImage(
          data: 'WIFI:S:${ssid};T:WPA;P:${password};;',
          size: 200,
        ),
      ),
    );
  }
}
