import 'package:flutter/material.dart';

class WifiList extends StatefulWidget {
  const WifiList({
    super.key,
    required this.ssid,
    required this.password,
  });
  final String ssid;
  final String password;
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
      body: WifiTile(
        ssid: widget.ssid,
        password: widget.password,
      ),
    );
  }
}

class WifiTile extends StatelessWidget {
  const WifiTile({
    Key? key,
    required this.ssid,
    required this.password,
  }) : super(key: key);
  final String ssid;
  final String password;
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
          const Icon(Icons.delete),
        ],
      ),
    );
  }
}
