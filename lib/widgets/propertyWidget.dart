import 'package:flutter/material.dart';
import 'package:lekki_phase_one/screens/show_property_page.dart';
import 'package:lekki_phase_one/screens/update_property_page.dart';

class PropertyView extends StatefulWidget {
  const PropertyView({
    Key? key,
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
    required this.validTo,
    required this.id,
    required this.image,
  }) : super(key: key);
  final String address;
  final String type;
  final String owner;
  final String bedroom;
  final String sittingRoom;
  final String kitchen;
  final String toilet;
  final String bathroom;
  final String description;
  final String validFrom;
  final String validTo;
  final String id;
  final List image;

  @override
  State<PropertyView> createState() => _PropertyViewState();
}

class _PropertyViewState extends State<PropertyView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ShowPropertyPage(
                    address: widget.address,
                    bedroom: widget.bedroom,
                    bathroom: widget.bathroom,
                    kitchen: widget.kitchen,
                    description: widget.description,
                    owner: widget.owner,
                    sittingRoom: widget.sittingRoom,
                    toilet: widget.toilet,
                    type: widget.type,
                    validFrom: widget.validFrom,
                    validTo: widget.validTo,
                    images: widget.image,
                  )),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(widget.image.isEmpty
                        ? "https://www.stylemotivation.com/wp-content/uploads/2021/07/02C.jpg"
                        : widget.image.first["path"]),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 150,
                width: 150,
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                height: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    Text(
                      'Property address: ${widget.address}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Property type: ${widget.type}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('Property Owner: ${widget.owner}',
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('No of bedrooms: ${widget.bedroom}',
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        )),
                    Row(
                      children: [
                        OutlinedButton(
                            child: const Text(
                              "Show",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              primary: Colors.indigo,
                              onSurface: Colors.grey,
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ShowPropertyPage(
                                            address: widget.address,
                                            bedroom: widget.bedroom,
                                            bathroom: widget.bathroom,
                                            kitchen: widget.kitchen,
                                            description: widget.description,
                                            owner: widget.owner,
                                            sittingRoom: widget.sittingRoom,
                                            toilet: widget.toilet,
                                            type: widget.type,
                                            validFrom: widget.validFrom,
                                            validTo: widget.validTo,
                                            images: widget.image,
                                          )));
                            }),
                        const SizedBox(
                          width: 20,
                        ),
                        OutlinedButton(
                            child: const Text(
                              "Update",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              primary: Colors.indigo,
                              onSurface: Colors.grey,
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => UpdatePropertyPage(
                                            address: widget.address,
                                            bedroom: widget.bedroom,
                                            bathroom: widget.bathroom,
                                            kitchen: widget.kitchen,
                                            description: widget.description,
                                            owner: widget.owner,
                                            sittingRoom: widget.sittingRoom,
                                            toilet: widget.toilet,
                                            type: widget.type,
                                            validFrom: widget.validFrom,
                                            validTo: widget.validTo,
                                            id: widget.id,
                                            images: widget.image,
                                          )));
                              print(widget.id);
                            }),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
