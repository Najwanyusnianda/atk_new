

import 'dart:convert';

import 'package:atktemp/model/permintaan.dart';
import 'package:equatable/equatable.dart';

abstract class AddPermintaanState extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];
  @override
  String toString() {
    return 'Todo { state}';
  }
}


class CartInitiated extends AddPermintaanState{
  @override
  String toString() {
    return '##Chart Initiated ##  ';
  }
}

class CartLoaded extends AddPermintaanState{
 List<Permintaan> permintaans;
 String atkName;
 int countCart;

  CartLoaded(this.permintaans,this.atkName,{this.countCart});



  @override
  List<Object> get props => [permintaans,atkName];


 @override
 String toString() {
   return '##Cart Loaded ## current keranjang : $permintaans ';
 }
}
