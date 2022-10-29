import 'package:flutter/material.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:async';

import '../constants.dart';

class POWER extends StatefulWidget {
  const POWER({super.key});

  @override
  State<POWER> createState() => _POWERState();
}

class _POWERState extends State<POWER> {
  int bus = 0;
  int power = 0;
  int supply = 0;
  int shunt = 0;

  Future<void> readPowerJson() async {
    final String response =
        await rootBundle.loadString('assets/power_data.json');
    final powerData = await json.decode(response);
    setState(() {
      bus = powerData['lat'];
      power = powerData['power'];
      supply = powerData['supl'];
      shunt = powerData['shunt'];
    });
  }

  List sparkChartData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black,
      appBar: myAppBar,
      drawer: Drawer(
        backgroundColor: Colors.grey[300],
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const DrawerHeader(child: Icon(FeatherIcons.activity)),
            ListTile(
              leading: Icon(FeatherIcons.home),
              title: TextButton(
                child: Text('ALBATROSS'),
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
              ),
            ),
            ListTile(
              leading: Icon(FeatherIcons.navigation),
              title: TextButton(
                child: Text('GPS'),
                onPressed: () {
                  Navigator.pushNamed(context, '/gps');
                },
              ),
            ),
            ListTile(
              leading: Icon(FeatherIcons.wifi),
              title: TextButton(
                child: Text('KIWIX'),
                onPressed: () {
                  Navigator.pushNamed(context, '/kiwix');
                },
              ),
            ),
            ListTile(
              leading: Icon(FeatherIcons.radio),
              title: TextButton(
                child: Text('RADIO'),
                onPressed: () {
                  Navigator.pushNamed(context, '/radio');
                },
              ),
            ),
            ListTile(
              leading: Icon(FeatherIcons.power),
              title: TextButton(child: Text('POWER'), onPressed: (null)),
            ),
          ],
        ),
      ),
      body: Row(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Container(
                child: SfSparkBarChart(data: [shunt, power, supply, bus]),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Expanded(
                  child: ListTile(
                    title: Text('SHUNT VOLTAGE'),
                    subtitle: Text(shunt.toString()),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text('CURRENT'),
                    subtitle: Text(bus.toString()),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text('POWER'),
                    subtitle: Text(power.toString()),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text('BATTERY %'),
                    subtitle: Text('DATA'),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text('TIME REMAINING'),
                    subtitle: Text('DATA'),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: (() => Timer.periodic(
                          Duration(seconds: 1),
                          ((timer) => readPowerJson()),
                        )),
                    child: Text('GET DATA'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
