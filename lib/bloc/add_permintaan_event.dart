
import 'package:atktemp/model/permintaan.dart';
import 'package:equatable/equatable.dart';

abstract class AddPermintaanEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];


}

class LoadCart extends AddPermintaanEvent{

  @override
  String toString() {
    return '==LoadCartSuccess Event ==';
  }
}



class AddToCartEvent extends AddPermintaanEvent{
 Permintaan permintaan;

  AddToCartEvent(this.permintaan);

 @override
 // TODO: implement props
 List<Object> get props => [permintaan];

 @override
 String toString() {
   return '==AddToChart Event ==  $permintaan';
 }
}

class SelectAtkEvent extends AddPermintaanEvent{
  String atkName;

  SelectAtkEvent(this.atkName);
}

class SubmitAtkEvent extends AddPermintaanEvent{
  List<Permintaan> permintaans;

  SubmitAtkEvent(this.permintaans);
  String toString() {
    return '==Submit Atk to Firestore Event == $permintaans';
  }
}

