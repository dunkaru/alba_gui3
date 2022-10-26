import 'package:alba_gui2/pages/gps.dart';
import 'package:flutter/material.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:alba_gui2/pages/dashboard.dart';
import 'package:alba_gui2/pages/kiwix.dart';
import 'package:alba_gui2/pages/radio.dart';
import 'package:alba_gui2/pages/power.dart';
import 'package:alba_gui2/util/parse_json.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Dashboard(),
      initialRoute: '/',
      routes: {
        '/gps': (context) => GPS(),
        '/kiwix': (context) => KIWIX(),
        '/radio': (context) => RADIO(),
        '/power': (context) => POWER(),
        //'/json': (context) => gpsJSON()
      },
    );
  }
}
