import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:alba_gui2/pages/gps.dart';

List<FileSystemEntity> files = [];

var myAppBar = AppBar(
  title: const Text('ALBATROSS'),
  backgroundColor: Colors.black,
);

void testDirectory() {
  Directory dir = Directory('D:/---NEW STORAGE HDD---/DND STUFF/Maps');
  files = dir.listSync();

  for (FileSystemEntity file in files) {
    FileStat f1 = file.statSync();
    //print(f1.toString());
  }
  print(files);
}
