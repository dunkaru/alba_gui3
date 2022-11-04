import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('something fucked up');
  }
}

class Album {
  final double lat;
  final String latD;
  final double long;
  final String longD;
  final String date;
  final String time;
  final int sv;

  const Album({
    required this.lat,
    required this.latD,
    required this.long,
    required this.longD,
    required this.date,
    required this.time,
    required this.sv,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      lat: json['lat'],
      latD: json['latD'],
      long: json['long'],
      longD: json['longD'],
      date: json['date'],
      time: json['time'],
      sv: json['sv'],
    );
  }
}


       /*    child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.title);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator(); 
      */