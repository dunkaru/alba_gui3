import 'package:flutter/material.dart';
import 'package:feather_icons/feather_icons.dart';

import '../constants.dart';

class POWER extends StatefulWidget {
  const POWER({super.key});

  @override
  State<POWER> createState() => _POWERState();
}

class _POWERState extends State<POWER> {
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
              children: const [
                Expanded(
                  child: ListTile(
                    title: Text('SHUNT VOLTAGE'),
                    subtitle: Text('DATA'),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text('CURRENT'),
                    subtitle: Text('DATA'),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text('POWER'),
                    subtitle: Text('DATA'),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
