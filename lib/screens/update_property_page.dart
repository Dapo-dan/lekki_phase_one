import 'package:flutter/material.dart';
import 'package:lekki_phase_one/navDrawer.dart';

class UpdatePropertyPage extends StatelessWidget {
  const UpdatePropertyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Update Property",
          style: TextStyle(fontSize: 20),
        ),
      ),
      backgroundColor: Colors.indigoAccent,
      body: Container(),
      drawer: NavDrawer(),
    );
  }
}
