import 'package:flutter/material.dart';
import 'package:feather_icons/feather_icons.dart';
import 'dart:async';
import 'package:process_run/shell.dart';

import '../constants.dart';
import '../util/httpReq.dart';

var shell = Shell();

class DashboardNew extends StatefulWidget {
  const DashboardNew({super.key});

  @override
  State<DashboardNew> createState() => _DashboardNewState();
}

class _DashboardNewState extends State<DashboardNew> {
  late Future<Album> futureAlbum;
  Future<AlbumP>? futureAlbumPwr;

  @override
  void initstate() {
    futureAlbum = fetchAlbum();
    futureAlbumPwr = fetchAlbumPwr();
  }

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
              DrawerHeader(
                  child: IconButton(
                      onPressed: () async => await shell
                          .run('chocolate-doom -iwad /doom-wad/DOOM1.WAD'),
                      icon: Image.asset('assets/images/ALBA_A.png'))),
              ListTile(
                leading: Icon(FeatherIcons.home),
                title: TextButton(child: Text('ALBATROSS'), onPressed: (null)),
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
        body: Column(
          children: [
            Row(
              children: [
                ElevatedButton(
                  onPressed: null,
                  child: Text('GPS'),
                ),
                ElevatedButton(
                  onPressed: null,
                  child: Text('KIWIX'),
                ),
                ElevatedButton(
                  onPressed: null,
                  child: Text('RADIO'),
                ),
                ElevatedButton(
                  onPressed: null,
                  child: Text('POWER'),
                ),
              ],
            ),
            Row(),
            SizedBox(),
          ],
        ));
  }
}
