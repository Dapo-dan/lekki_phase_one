import 'package:flutter/material.dart';
import 'package:lekki_phase_one/navDrawer.dart';

// ignore: must_be_immutable
class UpdatePropertyPage extends StatelessWidget {
  UpdatePropertyPage(
      {Key? key,
      required this.address,
      required this.type,
      required this.owner,
      required this.bedroom,
      required this.sittingRoom,
      required this.kitchen,
      required this.toilet,
      required this.bathroom,
      required this.description,
      required this.validFrom,
      required this.validTo})
      : super(key: key);
  String address;
  String type;
  String owner;
  String bedroom;
  String sittingRoom;
  String kitchen;
  String toilet;
  String bathroom;
  String description;
  String validFrom;
  String validTo;

  TextEditingController propertyAddress = TextEditingController();
  TextEditingController propertyType = TextEditingController();
  TextEditingController bedrooms = TextEditingController();
  TextEditingController bathrooms = TextEditingController();
  TextEditingController kitchens = TextEditingController();
  TextEditingController sittingRooms = TextEditingController();
  TextEditingController toilets = TextEditingController();
  TextEditingController validfrom = TextEditingController();
  TextEditingController validto = TextEditingController();
  TextEditingController propertyOwner = TextEditingController();
  TextEditingController propertyDescription = TextEditingController();

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
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      image: AssetImage("images/property3.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  height: 300,
                  width: double.infinity,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: propertyAddress,
                        decoration: InputDecoration(
                          focusColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),

                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.blue, width: 1.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          fillColor: Colors.grey, //create label
                          labelText: 'Property address: $address',
                          //label style
                          labelStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Property type: $type',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Number of bedroom: $bedroom',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Number of sitting rooms: $sittingRoom',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Number of kitchens: $kitchen',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Number of bathrooms: $bathroom',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Number of toilets: $toilet',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Property owner: $owner',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Description: $description',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Valid from: $validFrom',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Valid to: $validTo',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ],
        ),
      ),
      drawer: const NavDrawer(),
    );
  }
}
