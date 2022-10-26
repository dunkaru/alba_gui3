import 'package:flutter/material.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import '../constants.dart';

class GPS extends StatefulWidget {
  const GPS({super.key});

  @override
  State<GPS> createState() => _GPSState();
}

class _GPSState extends State<GPS> {
  String _lat = '';
  String _latD = '';
  String _long = '';
  String _longD = '';
  String _date = '';
  String _time = '';
  String _sv = '';

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await json.decode(response);
    setState(() {
      _lat = data["lat"];
      _latD = data["la_dir"];
      _long = data["long"];
      _longD = data["ln_dir"];
      _date = data["date"];
      _time = data["time"];
      _sv = data["sv"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey[800],
      appBar: myAppBar,
      drawer: Drawer(
        backgroundColor: Colors.grey[300],
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const DrawerHeader(child: Icon(FeatherIcons.activity)),
            ListTile(
              leading: const Icon(FeatherIcons.home),
              title: TextButton(
                child: const Text('ALBATROSS'),
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
              ),
            ),
            const ListTile(
              leading: Icon(FeatherIcons.navigation),
              title: TextButton(child: Text('GPS'), onPressed: (null)),
            ),
            ListTile(
              leading: const Icon(FeatherIcons.wifi),
              title: TextButton(
                child: const Text('KIWIX'),
                onPressed: () {
                  Navigator.pushNamed(context, '/kiwix');
                },
              ),
            ),
            ListTile(
              leading: const Icon(FeatherIcons.radio),
              title: TextButton(
                child: const Text('RADIO'),
                onPressed: () {
                  Navigator.pushNamed(context, '/radio');
                },
              ),
            ),
            ListTile(
              leading: const Icon(FeatherIcons.power),
              title: TextButton(
                child: const Text('POWER'),
                onPressed: () {
                  Navigator.pushNamed(context, '/power');
                },
              ),
            ),
          ],
        ),
      ),
      body: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: ListTile(
                    title: Text('GPS LAT'),
                    subtitle: Text(_lat),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text('LAT DIR'),
                    subtitle: Text(_latD),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text('GPS LONG'),
                    subtitle: Text(_long),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text('LONG DIR'),
                    subtitle: Text(_longD),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text('# OF SATS'),
                    subtitle: Text(_sv),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Center(
                  child: Image.asset('assets/images/placeholder.jpg'),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Expanded(
                  child: SizedBox(
                    width: 200,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        child: Text('REFRESH'),
                        onPressed: (readJson),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: 200,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        child: Text('SAVE IMAGE'),
                        onPressed: (null),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
