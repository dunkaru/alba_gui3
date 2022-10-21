import 'package:flutter/material.dart';
import 'package:feather_icons/feather_icons.dart';

import '../constants.dart';

class GPS extends StatefulWidget {
  const GPS({super.key});

  @override
  State<GPS> createState() => _GPSState();
}

class _GPSState extends State<GPS> {
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
              title: TextButton(child: Text('GPS'), onPressed: (null)),
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
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: const [
                Expanded(
                  child: ListTile(
                    title: Text('GPS LAT'),
                    subtitle: Text('DATA'),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text('LAT DIR'),
                    subtitle: Text('DATA'),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text('GPS LONG'),
                    subtitle: Text('DATA'),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text('LONG DIR'),
                    subtitle: Text('DATA'),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text('# OF SATS'),
                    subtitle: Text('DATA'),
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
                  child: Container(
                    child: SizedBox(
                      width: 200,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          child: Text('REFRESH'),
                          onPressed: (null),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: SizedBox(
                      width: 200,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          child: Text('SAVE IMAGE'),
                          onPressed: (null),
                        ),
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
