import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';


import '/src/app.dart';


void main() async {
  await Hive.initFlutter();

  runApp(const MyApp());
}

var box = Hive.box('wifiBox');

