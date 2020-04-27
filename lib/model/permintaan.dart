
import 'package:atktemp/entities/permintaanEntity.dart';
import 'package:meta/meta.dart';

class Permintaan{
  String atkName;
  String satuan;
  int jumlah;

  Permintaan({@required this.atkName,@required this.satuan,@required this.jumlah});

  PermintaanEntity toEntity(){
    return PermintaanEntity(atkName:atkName,satuan: satuan,jumlah: jumlah);
  }
}