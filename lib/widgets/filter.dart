import 'package:flutter/material.dart';
import 'package:lekki_phase_one/controller/property_controller.dart';
import 'package:lekki_phase_one/widgets/filter_screen_widget.dart';

// ignore: must_be_immutable
class Filter extends StatelessWidget {
  final PropertyController propertyController = PropertyController();

  TextEditingController owner = TextEditingController();

  Filter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return propertyController.fillern
        ? Column(
            children: [
              Expanded(
                child: AlertDialog(
                  title: const Text('Choose filters'),
                  content: Column(
                    children: [
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              ' Sitting rooms',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              child: Slider(
                            min: 0,
                            max: 10,
                            divisions: 10,
                            label:
                                propertyController.sitting.round().toString(),
                            value: propertyController.sitting,
                            onChanged: (value) {
                              propertyController.setState(
                                  param: propertyController.sitting,
                                  value: value);
                            },
                          )),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              ' Kitchens',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              child: Slider(
                            min: 0,
                            max: 10,
                            divisions: 10,
                            label:
                                propertyController.kitchen.round().toString(),
                            value: propertyController.kitchen,
                            onChanged: (value) {
                              propertyController.setState(
                                  param: propertyController.kitchen,
                                  value: value);
                            },
                          )),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Bedrooms',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              child: Slider(
                            min: 0,
                            max: 10,
                            label:
                                propertyController.bedroom.round().toString(),
                            divisions: 10,
                            value: propertyController.bedroom,
                            onChanged: (value) {
                              propertyController.setState(
                                  param: propertyController.bedroom,
                                  value: value);
                            },
                          )),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Bathrooms',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              child: Slider(
                            min: 0,
                            max: 10,
                            label:
                                propertyController.bathroom.round().toString(),
                            value: propertyController.bathroom,
                            divisions: 10,
                            onChanged: (value) {
                              propertyController.setState(
                                  param: propertyController.bathroom,
                                  value: value);
                            },
                          )),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Toilet',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              child: Slider(
                            min: 0,
                            max: 10,
                            label: propertyController.toilet.round().toString(),
                            value: propertyController.toilet,
                            divisions: 10,
                            onChanged: (value) {
                              propertyController.setState(
                                  param: propertyController.toilet,
                                  value: value);
                            },
                          )),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Property owner',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: owner,
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
                                fillColor: Colors.grey,

                                hintText: "Property Owner",

                                //make hint text
                                hintStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),

                                //create label
                                labelText: 'Property Owner',
                                //label style
                                labelStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  actions: [
                    OutlinedButton(
                        child: const Text(
                          "FILTER",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                          minimumSize: const Size(430, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          primary: Colors.indigo,
                          onSurface: Colors.grey,
                        ),
                        onPressed: () async {
                          var f = await propertyController.filterFunction(
                              sitting: propertyController.sitting,
                              bathroom: propertyController.bathroom,
                              bedroom: propertyController.bedroom,
                              kitchen: propertyController.kitchen,
                              owner: owner.text,
                              toilet: propertyController.toilet);
                          if (f.length != 0) {
                            propertyController.setState(
                                param: propertyController.fillern,
                                value: false);
                          } else {
                            Navigator.of(context).pop();
                          }
                        }),
                  ],
                ),
              ),
            ],
          )
        : Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: propertyController.filterList.length,
              //itemExtent: 10,
              itemBuilder: (BuildContext context, int index) {
                return FilterScreen(
                  address: propertyController.filterList[index].address,
                  bedroom:
                      propertyController.filterList[index].bedroom.toString(),
                  owner: propertyController.filterList[index].propertyOwner,
                  type: propertyController.filterList[index].type,
                  bathroom:
                      propertyController.filterList[index].bathroom.toString(),
                  description: propertyController.filterList[index].description,
                  kitchen:
                      propertyController.filterList[index].kitchen.toString(),
                  sittingRoom: propertyController.filterList[index].sittingRoom
                      .toString(),
                  toilet:
                      propertyController.filterList[index].toilet.toString(),
                  validFrom: propertyController.filterList[index].validFrom,
                  validTo: propertyController.filterList[index].validTo,
                  images: propertyController.filterList[index].images,
                );
              },
            ),
          );
  }
}
