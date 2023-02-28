import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '/src/app.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('wifiBox');
  runApp(const MyApp());
}

final box = Hive.box('wifiBox');

