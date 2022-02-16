import 'package:flutter/material.dart';
import 'package:lekki_phase_one/controller/property_controller.dart';
import 'package:lekki_phase_one/nav_drawer.dart';
import 'package:lekki_phase_one/widgets/filter.dart';
import 'package:lekki_phase_one/widgets/property_widget.dart';

class ListPropertyPage extends StatefulWidget {
  const ListPropertyPage({Key? key}) : super(key: key);

  @override
  State<ListPropertyPage> createState() => _ListPropertyPageState();
}

class _ListPropertyPageState extends State<ListPropertyPage> {
  final PropertyController propertyController = PropertyController();
  @override
  void initState() {
    propertyController.getProprty().then((value) {
      setState(() {
        propertyController.propertyList = value;
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
            const SizedBox(
              height: 10,
            ),
            OutlinedButton(
              child: const Text(
                'Filter by properties',
                style: TextStyle(fontSize: 20, color: Colors.indigo),
              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                minimumSize: const Size(430, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                primary: Colors.white,
                onSurface: Colors.grey,
              ),
              onPressed: () async {
                await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Filter();
                  },
                );
              },
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
                child: ListView.builder(
              shrinkWrap: true,
              itemCount: propertyController.propertyList.length,
              itemBuilder: (BuildContext context, int index) {
                return PropertyView(
                  address: propertyController.propertyList[index].address,
                  bedroom:
                      propertyController.propertyList[index].bedroom.toString(),
                  owner: propertyController.propertyList[index].propertyOwner,
                  type: propertyController.propertyList[index].type,
                  bathroom: propertyController.propertyList[index].bathroom
                      .toString(),
                  description:
                      propertyController.propertyList[index].description,
                  kitchen:
                      propertyController.propertyList[index].kitchen.toString(),
                  sittingRoom: propertyController
                      .propertyList[index].sittingRoom
                      .toString(),
                  toilet:
                      propertyController.propertyList[index].toilet.toString(),
                  validFrom: propertyController.propertyList[index].validFrom,
                  validTo: propertyController.propertyList[index].validTo,
                  id: propertyController.propertyList[index].id,
                  image: propertyController.propertyList[index].images,
                );
              },
            ))
          ],
        ),
      ),
      drawer: const NavDrawer(),
    );
  }
}
