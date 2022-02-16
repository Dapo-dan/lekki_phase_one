import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:lekki_phase_one/models/property_model.dart';

class PropertyController extends ChangeNotifier {
  final Dio dio = Dio();

  List<PropertyModel> propertyList = [];
  bool fillern = true;
  List<PropertyModel> filterList = [];

  double sitting = 0;
  double bathroom = 0;
  double bedroom = 0;
  double kitchen = 0;
  double toilet = 0;

  void setState({required dynamic param, required dynamic value}) {
    param = value;
    notifyListeners();
  }

  Future getProprty() async {
    var response = await dio.get(
        'https://sfc-lekki-property.herokuapp.com/api/v1/lekki/property',
        options: Options(contentType: 'application/json'));
    for (var item in response.data['data']) {
      propertyList.add(PropertyModel.fromJson(item));
    }
    return propertyList;
  }

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
      filterList.add(PropertyModel.fromJson(item));
    }
    return filterList;
  }

  Future<Response> updateProperty({
    required int bEdrooms,
    required int tOilet,
    required int bAthrooms,
    required String vAlidTo,
    required int sIttingroom,
    required int kItchens,
    required String dEscription,
    required String id,
  }) async {
    String pathUrl =
        'https://sfc-lekki-property.herokuapp.com/api/v1/lekki/property/$id';

    var data = {
      "bedroom": bEdrooms,
      "sittingRoom": sIttingroom,
      "kitchen": kItchens,
      "bathroom": bAthrooms,
      "toilet": tOilet,
      "description": dEscription,
      "validTo": vAlidTo,
    };

    Response response = await dio.patch(
      pathUrl,
      data: data,
      options: Options(
        contentType: "application/json",
      ),
    );

    return response;
  }

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
}
