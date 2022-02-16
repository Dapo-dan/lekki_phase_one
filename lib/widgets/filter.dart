import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lekki_phase_one/models/property_model.dart';
import 'package:lekki_phase_one/constants.dart';
import 'package:lekki_phase_one/widgets/filterScreenWidget.dart';

class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  double _sitting = 0;
  double _bathroom = 0;
  double _bedroom = 0;
  double _kitchen = 0;
  double _toilet = 0;
  @override
  void initState() {
    constants.propertyList.clear();
    // ignore: todo
    // TODO: implement initState
    super.initState();
  }

  TextEditingController owner = TextEditingController();
  Constants constants = Constants();
  Future filterFunction(
      {double? sitting,
      double? bathroom,
      double? bedroom,
      double? kitchen,
      double? toilet,
      String? owner}) async {
    var filterParam = {
      'bedroom': bedroom,
      'kitchen': kitchen,
      'toilet': toilet,
      'propertyOwner': owner,
      'sittingRoom': sitting,
      'bathroom': bathroom,
    };
    var response = await Dio().get(
        'https://sfc-lekki-property.herokuapp.com/api/v1/lekki/property',
        queryParameters: filterParam,
        options: Options(contentType: 'application/json'));

    for (var item in response.data['data']) {
      constants.filterList.add(PropertyModel.fromJson(item));
    }
    return constants.filterList;
  }

  @override
  Widget build(BuildContext context) {
    return constants.fillern
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
                            label: _sitting.round().toString(),
                            value: _sitting,
                            onChanged: (value) {
                              setState(() {
                                _sitting = value;
                              });
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
                            label: _kitchen.round().toString(),
                            value: _kitchen,
                            onChanged: (value) {
                              setState(() {
                                _kitchen = value;
                              });
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
                            label: _bedroom.round().toString(),
                            divisions: 10,
                            value: _bedroom,
                            onChanged: (value) {
                              setState(() {
                                _bedroom = value;
                              });
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
                            label: _bathroom.round().toString(),
                            value: _bathroom,
                            divisions: 10,
                            onChanged: (value) {
                              setState(() {
                                _bathroom = value;
                              });
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
                            label: _toilet.round().toString(),
                            value: _toilet,
                            divisions: 10,
                            onChanged: (value) {
                              setState(() {
                                _toilet = value;
                              });
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
                          var f = await filterFunction(
                              sitting: _sitting,
                              bathroom: _bathroom,
                              bedroom: _bedroom,
                              kitchen: _kitchen,
                              owner: owner.text,
                              toilet: _toilet);
                          if (f.length != 0) {
                            setState(() {
                              constants.fillern = false;
                            });
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
              itemCount: constants.filterList.length,
              //itemExtent: 10,
              itemBuilder: (BuildContext context, int index) {
                return FilterScreen(
                  address: constants.filterList[index].address,
                  bedroom: constants.filterList[index].bedroom.toString(),
                  owner: constants.filterList[index].propertyOwner,
                  type: constants.filterList[index].type,
                  bathroom: constants.filterList[index].bathroom.toString(),
                  description: constants.filterList[index].description,
                  kitchen: constants.filterList[index].kitchen.toString(),
                  sittingRoom:
                      constants.filterList[index].sittingRoom.toString(),
                  toilet: constants.filterList[index].toilet.toString(),
                  validFrom: constants.filterList[index].validFrom,
                  validTo: constants.filterList[index].validTo,
                  images: constants.filterList[index].images,
                );
              },
            ),
          );
  }
}
