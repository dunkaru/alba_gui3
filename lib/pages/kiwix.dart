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
        body: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            //first column here
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: const [
                  Expanded(
                    child: Text('test'),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.green,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: files.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Text(files.toString()[index]),
                            textColor: Colors.black,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
