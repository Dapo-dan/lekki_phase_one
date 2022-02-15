import 'package:flutter/material.dart';
import 'package:lekki_phase_one/screens/list_property_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lekki phase 1 properties',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const ListPropertyPage(),
    );
  }
}
