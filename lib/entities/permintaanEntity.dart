
import 'package:atktemp/model/permintaan.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class PermintaanEntity extends Equatable{
  String atkName;
  String satuan;
  int jumlah;
  @override
  // TODO: implement props
  List<Object> get props => [atkName,satuan,jumlah];

  PermintaanEntity({@required this.atkName,@required this.satuan,@required this.jumlah});
  Map<String, dynamic> toMap() {
    return {
      'atkName': atkName,
      'satuan': satuan,
      'jumlah':jumlah
    };
  }



}