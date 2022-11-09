import 'package:flutter/material.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:process_run/shell.dart';

import '../constants.dart';

var shell = Shell();

class RADIO extends StatefulWidget {
  const RADIO({super.key});

  @override
  State<RADIO> createState() => _RADIOState();
}

class _RADIOState extends State<RADIO> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                onPressed: (null),
              ),
            ),
            ListTile(
              leading: Icon(FeatherIcons.power),
              title: TextButton(
                child: Text('POWER'),
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
              children: [
                Container(
                  child: ElevatedButton(
                    child: Text('GQRX - NOAA15'),
                    onPressed: () async =>
                        await shell.run('gqrx --c noaa15.conf'),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Container(
                  child: ElevatedButton(
                    child: Text('GQRX - NOAA18'),
                    onPressed: () async =>
                        await shell.run('gqrx --c noaa18.conf'),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Container(
                  child: ElevatedButton(
                    child: Text('GQRX - NOAA19'),
                    onPressed: () async =>
                        await shell.run('gqrx --c noaa19.conf'),
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
