// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:lekki_phase_one/constants.dart';
import 'package:lekki_phase_one/models/property_model.dart';
import 'package:lekki_phase_one/navDrawer.dart';
import 'package:lekki_phase_one/widgets/filter.dart';
import 'package:lekki_phase_one/widgets/propertyWidget.dart';

class ListPropertyPage extends StatefulWidget {
  const ListPropertyPage({Key? key}) : super(key: key);

  @override
  State<ListPropertyPage> createState() => _ListPropertyPageState();
}

class _ListPropertyPageState extends State<ListPropertyPage> {
  Constants constants = Constants();
  Future getProprty() async {
    var response = await Dio().get(
        'https://sfc-lekki-property.herokuapp.com/api/v1/lekki/property',
        options: Options(contentType: 'application/json'));
    for (var item in response.data['data']) {
      constants.propertyList.add(PropertyModel.fromJson(item));
    }
    return constants.propertyList;
  }

  @override
  void initState() {
    getProprty().then((value) {
      setState(() {
        constants.propertyList = value;
        // print(constants.propertyList[0].toJson());
      });
    });
    // ignore: todo
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "List of Available properties",
          style: TextStyle(fontSize: 20),
        ),
      ),
      backgroundColor: Colors.indigoAccent,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () async {
                      await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const Filter();
                        },
                      );
                    },
                    child: const Text(
                      'Filter by properties',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: ListView.builder(
              shrinkWrap: true,
              itemCount: constants.propertyList.length,
              //itemExtent: 10,
              itemBuilder: (BuildContext context, int index) {
                return PropertyView(
                  address: constants.propertyList[index].address,
                  bedroom: constants.propertyList[index].bedroom.toString(),
                  owner: constants.propertyList[index].propertyOwner,
                  type: constants.propertyList[index].type,
                  bathroom: constants.propertyList[index].bathroom.toString(),
                  description: constants.propertyList[index].description,
                  kitchen: constants.propertyList[index].kitchen.toString(),
                  sittingRoom:
                      constants.propertyList[index].sittingRoom.toString(),
                  toilet: constants.propertyList[index].toilet.toString(),
                  validFrom: constants.propertyList[index].validFrom,
                  validTo: constants.propertyList[index].validTo,
                );
              },
            ))
          ],
        ),
      ),
      drawer: NavDrawer(),
    );
  }
}
