import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Album> fetchAlbum() async {
  final response = await http.get(Uri.parse('http://127.0.0.1:5000/gps'));

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('something fucked up');
  }
}

class Album {
  final String lat;
  final String latD;
  final String long;
  final String longD;
  final String date;
  final String time;
  final String sv;
  final String alt;

  const Album({
    required this.lat,
    required this.latD,
    required this.long,
    required this.longD,
    required this.date,
    required this.time,
    required this.sv,
    required this.alt,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      alt: json['alt'],
      date: json['date'],
      latD: json['la_dir'],
      lat: json['lat'],
      longD: json['ln_dir'],
      long: json['long'],
      sv: json['sv'],
      time: json['time'],
    );
  }
}

Future<AlbumP> fetchAlbumPwr() async {
  final response = await http.get(Uri.parse('http://127.0.0.1:5000/power'));

  if (response.statusCode == 200) {
    return AlbumP.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('something fucked up');
  }
}

class AlbumP {
  final String bus;
  final String power;
  final String shunt;
  final String supl;

  const AlbumP({
    required this.bus,
    required this.power,
    required this.shunt,
    required this.supl,
  });

  factory AlbumP.fromJson(Map<String, dynamic> json) {
    return AlbumP(
      bus: json['bus'],
      power: json['power'],
      shunt: json['shunt'],
      supl: json['supl'],
    );
  }
}
