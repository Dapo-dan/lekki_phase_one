// To parse this JSON data, do
//
//     final propertyModel = propertyModelFromJson(jsonString);

import 'dart:convert';

PropertyModel propertyModelFromJson(String str) =>
    PropertyModel.fromJson(json.decode(str));

String propertyModelToJson(PropertyModel data) => json.encode(data.toJson());

class PropertyModel {
  PropertyModel({
    required this.address,
    required this.type,
    required this.bedroom,
    required this.sittingRoom,
    required this.kitchen,
    required this.bathroom,
    required this.toilet,
    required this.propertyOwner,
    required this.description,
    required this.validFrom,
    required this.images,
    required this.validTo,
    required this.id,
  });

  String address;
  String type;
  int bedroom;
  int sittingRoom;
  int kitchen;
  int bathroom;
  int toilet;
  String propertyOwner;
  String description;
  String validFrom;
  String validTo;
  List images;
  String id;

  factory PropertyModel.fromJson(Map<String, dynamic> json) => PropertyModel(
        address: json["address"],
        type: json["type"],
        bedroom: json["bedroom"],
        sittingRoom: json["sittingRoom"],
        kitchen: json["kitchen"],
        bathroom: json["bathroom"],
        toilet: json["toilet"],
        propertyOwner: json["propertyOwner"],
        description: json["description"],
        validFrom: json["validFrom"],
        images: json["images"],
        validTo: json["validTo"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "type": type,
        "bedroom": bedroom,
        "sittingRoom": sittingRoom,
        "kitchen": kitchen,
        "bathroom": bathroom,
        "toilet": toilet,
        "propertyOwner": propertyOwner,
        "description": description,
        "validFrom": validFrom,
        "validTo": validTo,
        "_id": id,
        "images": images,
      };
}
