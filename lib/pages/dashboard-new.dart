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
  Future<Album>? futureAlbum;
  Future<AlbumP>? futureAlbumPwr;

  @override
  void initstate() {
    super.initState();
    futureAlbum = fetchAlbum();
    futureAlbumPwr = fetchAlbumPwr();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.black,
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
              const ListTile(
                leading: Icon(FeatherIcons.home),
                title: TextButton(child: Text('ALBATROSS'), onPressed: (null)),
              ),
              ListTile(
                leading: const Icon(FeatherIcons.navigation),
                title: TextButton(
                  child: const Text('GPS'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/gps');
                  },
                ),
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
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: (GridView.count(
                    childAspectRatio: 2,
                    crossAxisCount: 4,
                    shrinkWrap: true,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/gps');
                          },
                          child: Text("GPS"),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/kiwix');
                          },
                          child: Text("KIWIX"),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/radio');
                          },
                          child: Text("RADIO"),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/power');
                          },
                          child: Text("POWER"),
                        ),
                      ),
                    ],
                  )),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: GridView.count(
                    padding: const EdgeInsets.all(10),
                    crossAxisCount: 4,
                    childAspectRatio: 2,
                    shrinkWrap: true,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: const Text("GPS LAT"),
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
                          tileColor: Colors.grey[300],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: const Text("GPS LONG"),
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
                          tileColor: Colors.grey[300],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: const Text("TIME"),
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
                          tileColor: Colors.grey[300],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: const Text("POWER"),
                          subtitle: FutureBuilder<AlbumP>(
                            future: futureAlbumPwr,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                var _power = snapshot.data!.power;
                                double powerConv =
                                    (double.parse(_power) / 1000);
                                return Text(powerConv.toStringAsFixed(2));
                              } else if (snapshot.hasError) {
                                return Text('${snapshot.error}');
                              }

                              // By default, show a loading spinner.
                              return const CircularProgressIndicator();
                            },
                          ),
                          tileColor: Colors.grey[300],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: const Text("LAT DIR"),
                          subtitle: FutureBuilder<Album>(
                            future: futureAlbum,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Text(snapshot.data!.latD);
                              } else if (snapshot.hasError) {
                                return Text('${snapshot.error}');
                              }

                              // By default, show a loading spinner.
                              return const CircularProgressIndicator();
                            },
                          ),
                          tileColor: Colors.grey[300],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: const Text("LAT DIR"),
                          subtitle: FutureBuilder<Album>(
                            future: futureAlbum,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Text(snapshot.data!.latD);
                              } else if (snapshot.hasError) {
                                return Text('${snapshot.error}');
                              }

                              // By default, show a loading spinner.
                              return const CircularProgressIndicator();
                            },
                          ),
                          tileColor: Colors.grey[300],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: const Text("CURRENT"),
                          subtitle: FutureBuilder<AlbumP>(
                            future: futureAlbumPwr,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                var current = snapshot.data!.current;
                                double currentConv =
                                    (double.parse(current) / 1000);
                                return Text(currentConv.toStringAsFixed(2));
                              } else if (snapshot.hasError) {
                                return Text('${snapshot.error}');
                              }

                              // By default, show a loading spinner.
                              return const CircularProgressIndicator();
                            },
                          ),
                          tileColor: Colors.grey[300],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: const Text("DATE"),
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
                          tileColor: Colors.grey[300],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: 100,
                    width: 300,
                    child: Image.asset('assets/images/ALBA_FULL.png'))
              ],
            )
          ],
        ));
  }
}
