import 'package:flutter/material.dart';
import 'package:wifi_qrcode/main.dart';

class WifiList extends StatefulWidget {
  const WifiList({
    super.key,
    // required this.ssid,
    // required this.password,
  });
  // final String ssid
  // final String password;
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
            onPressed: () async {
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
    required this.onPressed,
  }) : super(key: key);
  final String ssid;
  final String password;
  final Function() onPressed;
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
          const Icon(Icons.qr_code),
          const SizedBox(width: 40),
          IconButton(onPressed: onPressed, icon: const Icon(Icons.delete)),
        ],
      ),
    );
  }
}
