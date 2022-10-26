import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';

class gpsJSON extends StatefulWidget {
  const gpsJSON({super.key});

  @override
  State<gpsJSON> createState() => _gpsJSONState();
}

class _gpsJSONState extends State<gpsJSON> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          builder: (context, snapshot) {
            var showData = json.decode(snapshot.data.toString());
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text('Latitude'),
                  subtitle: Text(showData[index]['lat']),
                );
              },
              itemCount: showData.length,
            );
          },
        ),
      ),
    );
  }
}
