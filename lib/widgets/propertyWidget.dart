import 'package:flutter/material.dart';
import 'package:lekki_phase_one/screens/show_property_page.dart';

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
                  image: const DecorationImage(
                    image: AssetImage("images/property1.jpg"),
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
