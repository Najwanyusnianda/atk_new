

import 'package:atktemp/entities/permintaanEntity.dart';
import 'package:atktemp/model/permintaan.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PermintaanRepository{
  List<Map> permintaanData;
  final permintaanCollection =Firestore.instance.collection("permintaan");

  static List<Map> ConvertPermintaanListToMap({List<Permintaan> permintaans}) {
    List<Map> permintaanSteps = [];
    permintaans.forEach((Permintaan permintaan) {
      Map step = permintaan.toEntity().toMap();
      permintaanSteps.add(step);
    });
    return permintaanSteps;
  }

    Future<void> storePermintaanCart(List<Permintaan> permintaans) async {

       permintaanData=ConvertPermintaanListToMap(permintaans: permintaans);

       print(permintaanData.toString());
        return permintaanCollection.document().setData({ 'title': 'title', 'author': permintaanData });

    }
}
