import 'package:flutter/material.dart';
import 'package:feather_icons/feather_icons.dart';
import 'dart:async';
import 'package:process_run/shell.dart';

import '../constants.dart';
import '../util/httpReq.dart';

var shell = Shell();

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late Future<Album> futureAlbum;
  Future<AlbumP>? futureAlbumPwr;

  @override
  void initState() {
    super.initState();
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
          SizedBox(
            height: 150,
            child: GridView.count(
              childAspectRatio: 2,
              shrinkWrap: true,
              //primary: false,
              padding: const EdgeInsets.all(20),
              //crossAxisSpacing: 10,
              //mainAxisSpacing: 10,
              crossAxisCount: 4,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.grey[300],
                  child: ElevatedButton(
                    child: Text('GPS'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/gps');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      foregroundColor: Colors.black,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.grey[300],
                  child: ElevatedButton(
                    child: Text('KIWIX'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/kiwix');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      foregroundColor: Colors.black,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.grey[300],
                  child: ElevatedButton(
                    child: Text('POWER'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/power');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      foregroundColor: Colors.black,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.grey[300],
                  child: ElevatedButton(
                    child: Text('RADIO'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/radio');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      foregroundColor: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 4,
              //crossAxisSpacing: 10,
              //mainAxisSpacing: 10,
              padding: const EdgeInsets.all(8.0),
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.grey[300],
                  child: ListTile(
                    title: Text('GPS LAT'),
                    subtitle: FutureBuilder<Album>(
                      future: futureAlbum,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(double.parse(snapshot.data!.lat)
                              .toStringAsFixed(2));
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }

                        // By default, show a loading spinner.
                        return const CircularProgressIndicator();
                      },
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.grey[300],
                  child: ListTile(
                    title: Text('GPS LONG'),
                    subtitle: FutureBuilder<Album>(
                      future: futureAlbum,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(double.parse(snapshot.data!.long)
                              .toStringAsFixed(2));
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }

                        // By default, show a loading spinner.
                        return const CircularProgressIndicator();
                      },
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.grey[300],
                  child: ListTile(
                    title: Text('TIME'),
                    subtitle: FutureBuilder<Album>(
                      future: futureAlbum,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(snapshot.data!.time);
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }

                        // By default, show a loading spinner.
                        return const CircularProgressIndicator();
                      },
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.grey[300],
                  child: ListTile(
                    title: Text('POWER'),
                    subtitle: FutureBuilder<AlbumP>(
                      future: futureAlbumPwr,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          var _power = snapshot.data!.power;
                          double powerConv = (double.parse(_power) / 1000);
                          return Text(powerConv.toStringAsFixed(2));
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }

                        // By default, show a loading spinner.
                        return const CircularProgressIndicator();
                      },
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.grey[300],
                  child: ListTile(
                    title: Text('CURRENT'),
                    subtitle: FutureBuilder<AlbumP>(
                      future: futureAlbumPwr,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          var current = snapshot.data!.current;
                          double currentConv = (double.parse(current) / 1000);
                          return Text(currentConv.toStringAsFixed(2));
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }

                        // By default, show a loading spinner.
                        return const CircularProgressIndicator();
                      },
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.grey[300],
                  child: ListTile(
                    title: Text('DATE'),
                    subtitle: FutureBuilder<Album>(
                      future: futureAlbum,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(snapshot.data!.date);
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }

                        // By default, show a loading spinner.
                        return const CircularProgressIndicator();
                      },
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
