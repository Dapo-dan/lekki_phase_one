import 'package:flutter/material.dart';
import 'package:lekki_phase_one/screens/add_property_page.dart';
import 'package:lekki_phase_one/screens/list_property_page.dart';
import 'package:lekki_phase_one/screens/update_property_page.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.indigo,
            ),
            child: Center(
              child: Row(
                children: const [
                  Expanded(
                    child: Icon(
                      Icons.house,
                      color: Colors.white,
                      size: 40,
                    ),
                    flex: 2,
                  ),
                  Expanded(
                    flex: 6,
                    child: Text(
                      "Lekki Phase 1 properties",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: const Text("List of properties",
                style: TextStyle(fontSize: 20)),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const ListPropertyPage()));
            },
          ),
          const Divider(
            color: Colors.grey,
          ),
          ListTile(
            title: const Text("Add new properties",
                style: TextStyle(fontSize: 20)),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const AddPropertyPage()));
            },
          ),
          const Divider(
            color: Colors.grey,
          ),
          ListTile(
            title:
                const Text("Update Property", style: TextStyle(fontSize: 20)),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => UpdatePropertyPage(
                        address: '',
                        bathroom: '',
                        bedroom: '',
                        description: '',
                        kitchen: '',
                        owner: '',
                        sittingRoom: '',
                        toilet: '',
                        type: '',
                        validFrom: '',
                        validTo: '',
                      )));
            },
          )
        ],
      ),
    );
  }
}
