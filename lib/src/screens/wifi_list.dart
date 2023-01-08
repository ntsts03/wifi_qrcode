import 'package:flutter/material.dart';

class Record extends StatefulWidget {
  const Record({super.key});

  @override
  State<Record> createState() => _RecordState();
}

class _RecordState extends State<Record> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('保存されたWiFi'),
      ),
      body: WifiTile(ssid: , password: ,),
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
                  children: const [
                    Text(
                      'パスワード',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: Text('パスワード内容'),
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