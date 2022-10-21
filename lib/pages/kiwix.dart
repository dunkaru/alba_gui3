import 'package:flutter/material.dart';
import 'package:feather_icons/feather_icons.dart';

import '../constants.dart';

class KIWIX extends StatefulWidget {
  const KIWIX({super.key});

  @override
  State<KIWIX> createState() => _KIWIXState();
}

class _KIWIXState extends State<KIWIX> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
              title: TextButton(child: Text('KIWIX'), onPressed: (null)),
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
      body: Column(children: [
        AspectRatio(
          aspectRatio: 8,
          child: SizedBox(
            width: double.infinity,
            height: 100,
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.grey[300],
                  child: Text('GPS Data Lat'),
                  width: 100,
                  height: 100,
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.grey[300],
                  child: const Text('GPS Data Long'),
                  width: 100,
                  height: 100,
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.grey[300],
                  child: const Text('Direction Lat'),
                  width: 100,
                  height: 100,
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.grey[300],
                  child: const Text('Direction Long'),
                  width: 100,
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
