import 'package:flutter/material.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'dart:async';
import 'dart:math';

import '../util/httpReq.dart';
import '../constants.dart';

class POWER extends StatefulWidget {
  const POWER({super.key});

  @override
  State<POWER> createState() => _POWERState();
}

class _POWERState extends State<POWER> {
  late Future<AlbumP> futureAlbumPwr;

  @override
  void initState() {
    super.initState();
    futureAlbumPwr = fetchAlbumPwr();
  }

  List sparkChartData = [];
  var _power;
  var _bus;
  var _current;
  var _shunt;
  late double currentConv;
  late double shuntDbl;
  late double powerConv;
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
            flex: 1,
            child: Column(
              children: [
                Expanded(
                  child: ListTile(
                    title: Text('VOLTAGE'),
                    subtitle: FutureBuilder<AlbumP>(
                      future: futureAlbumPwr,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          _shunt = snapshot.data!.bus;
                          shuntDbl = (double.parse(_shunt));
                          return Text(snapshot.data!.bus);
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }

                        // By default, show a loading spinner.
                        return const CircularProgressIndicator();
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text('CURRENT (mA)'),
                    subtitle: FutureBuilder<AlbumP>(
                      future: futureAlbumPwr,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          var current = snapshot.data!.current;
                          double currentConv = (double.parse(current) / 1000);
                          return Text(currentConv.toString());
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }

                        // By default, show a loading spinner.
                        return const CircularProgressIndicator();
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text('POWER (mW)'),
                    subtitle: FutureBuilder<AlbumP>(
                      future: futureAlbumPwr,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          _power = snapshot.data!.power;
                          double powerConv = (double.parse(_power) / 1000);
                          return Text(snapshot.data!.power);
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }

                        // By default, show a loading spinner.
                        return const CircularProgressIndicator();
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text('SUPPLY VOLTAGE (V)'),
                    subtitle: FutureBuilder<AlbumP>(
                      future: futureAlbumPwr,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          _power = snapshot.data!.supl;
                          return Text(snapshot.data!.supl);
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }

                        // By default, show a loading spinner.
                        return const CircularProgressIndicator();
                      },
                    ),
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
                    onPressed: null,
                    child: Text('GET DATA'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: FutureBuilder<AlbumP>(
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SfSparkBarChart(
                        data: <double>[currentConv, shuntDbl, powerConv]);
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  //return const CircularProgressIndicator();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
