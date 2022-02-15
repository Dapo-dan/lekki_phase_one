import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:lekki_phase_one/screens/list_property_page.dart';

class AddPropertyPage extends StatefulWidget {
  const AddPropertyPage({Key? key}) : super(key: key);

  @override
  State<AddPropertyPage> createState() => _AddPropertyPageState();
}

class _AddPropertyPageState extends State<AddPropertyPage> {
  Dio dio = Dio();

  Future<Response> postProperty(
      {required String oWner,
      required int bEdrooms,
      required int tOilet,
      required int bAthrooms,
      required String vAlidFrom,
      required String vAlidTo,
      required String aDdress,
      required int sIttingroom,
      required int kItchens,
      required String dEscription,
      required String tYpe,
      required List iMages}) async {
    const String pathUrl =
        'https://sfc-lekki-property.herokuapp.com/api/v1/lekki/property';

    var data = {
      "address": aDdress,
      "type": tYpe,
      "bedroom": bEdrooms,
      "sittingRoom": sIttingroom,
      "kitchen": kItchens,
      "bathroom": bAthrooms,
      "toilet": tOilet,
      "propertyOwner": oWner,
      "description": dEscription,
      "validFrom": vAlidFrom,
      "validTo": vAlidTo,
      "images": iMages,
    };

    Response response = await dio.post(
      pathUrl,
      data: data,
      options: Options(
        contentType: "application/json",
      ),
    );

    return response;
  }

  TextEditingController propertyAddress = TextEditingController();
  TextEditingController propertyType = TextEditingController();
  TextEditingController bedrooms = TextEditingController();
  TextEditingController bathrooms = TextEditingController();
  TextEditingController kitchens = TextEditingController();
  TextEditingController sittingRooms = TextEditingController();
  TextEditingController toilets = TextEditingController();
  TextEditingController validfrom = TextEditingController();
  TextEditingController validto = TextEditingController();
  TextEditingController owner = TextEditingController();
  TextEditingController propertyDescription = TextEditingController();

  //For uploading the image and getting the path from the endpoint before the property upload
  List images = [
    {
      "fieldname": "file",
      "originalname": "20210326_114624.jpg",
      "encoding": "7bit",
      "mimetype": "image/jpeg",
      "path":
          "https://res.cloudinary.com/moyinoluwa/image/upload/v1642090750/sfc/lekki/p3dlgkz2guhrwouwukdp.jpg",
      "size": 1640612,
      "filename": "sfc/lekki/p3dlgkz2guhrwouwukdp"
    },
    {
      "fieldname": "file",
      "originalname": "20210326_114624.jpg",
      "encoding": "7bit",
      "mimetype": "image/jpeg",
      "path":
          "https://res.cloudinary.com/moyinoluwa/image/upload/v1642090750/sfc/lekki/p3dlgkz2guhrwouwukdp.jpg",
      "size": 1640612,
      "filename": "sfc/lekki/p3dlgkz2guhrwouwukdp"
    }
  ];
  // Future<void> uploadProfilePic({required String path}) async {
  //   List<MultipartFile> files = [];

  //   files.add(await MultipartFile.fromFile(path));

  //   var formData = FormData.fromMap({"file": files});

  //   var response = await Dio().post(
  //     'https://sfc-lekki-property.herokuapp.com/api/v1/lekki/upload',
  //     data: formData,
  //     options: Options(
  //       headers: {"content-type": "multipart/form-data"},
  //     ),
  //   );

  //   //print('uploadResponse: $response');
  //   images.add(response.data['data']);
  // }

  @override
  void initState() {
    validfrom.text = ""; //set the initial value of text field
    validto.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Add new properties",
            style: TextStyle(fontSize: 20),
          ),
        ),
        backgroundColor: Colors.indigoAccent,
        body: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                TextFormField(
                  controller: propertyAddress,
                  decoration: InputDecoration(
                    focusColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 1.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    fillColor: Colors.grey,
                    hintText: "Property address",
                    //make hint text
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    //create lable
                    labelText: 'Property address',
                    //lable style
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: propertyType,
                  decoration: InputDecoration(
                    focusColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 1.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    fillColor: Colors.grey,
                    hintText: "Property type (house,flat etc.)",
                    //make hint text
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    //create lable
                    labelText: 'Property type (house,flat etc.)',
                    //lable style
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: bedrooms,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                    focusColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 1.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    fillColor: Colors.grey,
                    hintText: "Number of bedrooms",
                    //make hint text
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    //create lable
                    labelText: 'Number of bedrooms',
                    //lable style
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: sittingRooms,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                    focusColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 1.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    fillColor: Colors.grey,
                    hintText: "Number of sitting rooms",
                    //make hint text
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    //create lable
                    labelText: 'Number of sitting rooms',
                    //lable style
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: kitchens,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                    focusColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 1.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    fillColor: Colors.grey,
                    hintText: "Number of kitchen",
                    //make hint text
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    //create lable
                    labelText: 'Number of kitchen',
                    //lable style
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: bathrooms,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                    focusColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 1.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    fillColor: Colors.grey,
                    hintText: "Number of bathrooms",
                    //make hint text
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    //create lable
                    labelText: 'Number of bathrooms',
                    //lable style
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: toilets,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                    focusColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 1.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    fillColor: Colors.grey,
                    hintText: "Number of toilets",
                    //make hint text
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    //create lable
                    labelText: 'Number of toilets',
                    //lable style
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: owner,
                  decoration: InputDecoration(
                    focusColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 1.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    fillColor: Colors.grey,
                    hintText: "Property owner",
                    //make hint text
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    //create lable
                    labelText: 'Property owner',
                    //lable style
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: propertyDescription,
                  decoration: InputDecoration(
                    focusColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 1.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    fillColor: Colors.grey,
                    hintText: "Description",
                    //make hint text
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    //create lable
                    labelText: 'Description',
                    //lable style
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: validfrom,
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(
                            2000), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101));

                    if (pickedDate != null) {
                      print(
                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(
                          formattedDate); //formatted date output using intl package =>  2021-03-16
                      //you can implement different kind of Date Format here according to your requirement

                      setState(() {
                        validfrom.text =
                            formattedDate; //set output date to TextField value.
                      });
                    } else {
                      print("Date is not selected");
                    }
                  },
                  decoration: InputDecoration(
                    focusColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 1.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    fillColor: Colors.grey,
                    hintText: "Valid from, do not input today's date",
                    //make hint text
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    //create lable
                    labelText: 'Valid from',
                    //lable style
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: validto,
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(
                            2000), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101));

                    if (pickedDate != null) {
                      print(
                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(
                          formattedDate); //formatted date output using intl package =>  2021-03-16
                      //you can implement different kind of Date Format here according to your requirement

                      setState(() {
                        validto.text =
                            formattedDate; //set output date to TextField value.
                      });
                    } else {
                      print("Date is not selected");
                    }
                  },
                  decoration: InputDecoration(
                    focusColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 1.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    fillColor: Colors.grey,
                    hintText: "Valid to",
                    //make hint text
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    //create lable
                    labelText: 'Valid to',
                    //lable style
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                // const ImageWidget(),
                const SizedBox(
                  height: 20,
                ),
                OutlinedButton(
                    child: const Text(
                      "Upload",
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
                      final String address = propertyAddress.text.trim();
                      final String type = propertyType.text.trim();
                      final int bedroom = int.parse(bedrooms.text.trim());
                      final int bathroom = int.parse(bathrooms.text.trim());
                      final int kitchen = int.parse(kitchens.text.trim());
                      final int sittingRoom =
                          int.parse(sittingRooms.text.trim());
                      final int toilet = int.parse(toilets.text.trim());
                      final String validFrom = validfrom.text.trim();
                      final String validTo = validto.text.trim();
                      final String oWner = owner.text.trim();
                      final String description =
                          propertyDescription.text.trim();

                      Response property = await postProperty(
                          oWner: oWner,
                          bEdrooms: bedroom,
                          tOilet: toilet,
                          bAthrooms: bathroom,
                          vAlidFrom: validFrom,
                          vAlidTo: validTo,
                          aDdress: address,
                          sIttingroom: sittingRoom,
                          kItchens: kitchen,
                          dEscription: description,
                          iMages: images,
                          tYpe: type);
                      if (property.statusCode == 201) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ListPropertyPage()));
                      } else {
                        print(e);
                      }
                    }),
              ],
            ),
          ),
        ));
  }
}
