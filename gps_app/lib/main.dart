import 'package:flutter/material.dart';
import 'geomap_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Map Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GeoMapPage(), // Display the GeoMapPage
    );
  }
}
