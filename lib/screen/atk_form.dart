import 'package:atktemp/bloc/add_permintaan_bloc.dart';
import 'package:atktemp/bloc/add_permintaan_event.dart';
import 'package:atktemp/bloc/add_permintaan_state.dart';
import 'package:atktemp/model/permintaan.dart';
import 'package:atktemp/screen/atk_request_list.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cart_list_screen.dart';

class AtkRequestFormPage extends StatelessWidget {
  var nameList = new List();
  //String name;
  String jumlah;
  String satuan;
  String atkName;
  int jumlah_permintaan=0;
  List daftarAtk=["Buku","Pulpen","Kertas"];
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Color hexToColor(String code) {
      return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
    }
    return BlocConsumer<AddPermintaanBloc,AddPermintaanState>(
      listener: (BuildContext context,state){

      },
      builder:(context,state){
        if(state is CartInitiated){
          CircularProgressIndicator();
        }
        if(state is CartLoaded){
          String countItem=(state.countCart ?? 0).toString();
          return Scaffold(
            body: Container(

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Form(
                        key: _formKey,
                        child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Column(
                              children: <Widget>[
                                Text('FORM PENGAJUAN ATK',
                                  style: new TextStyle(
                                      color: hexToColor("#2c3e50"),
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold),


                                ),
                                new Padding(padding: EdgeInsets.only(top: 50.0)),
                                Text('Nama Seksi : IPDS'),
                                Text('Tanggal : 12- 12-2020'),
                                Divider(
                                  color: Colors.black,
                                ),
                                SizedBox(height: 20),
                                DropdownButtonFormField(
                                    value: state.atkName,
                                    decoration: InputDecoration(
                                      labelText: "Alat Tulis Kantor",
                                      fillColor: Colors.white,
                                      border: new OutlineInputBorder(
                                        borderRadius: new BorderRadius.circular(25.0),
                                        borderSide: new BorderSide(
                                        ),
                                      ),
                                    ),
                                    isExpanded: true,
                                    isDense: true,
                                    items:daftarAtk.map((val){
                                      return DropdownMenuItem(
                                        child: Text(val),
                                        value: val,
                                      );
                                    }).toList(),
                                    onChanged: (value){
                                      atkName=value;
                                      BlocProvider.of<AddPermintaanBloc>(context).add(SelectAtkEvent(atkName));
                                      print(atkName);
                                    }
                                ),
                                SizedBox(height: 20),
                                TextFormField(
                                  validator: (value){
                                    if(value.isEmpty){
                                      return 'Tidak boleh null';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: "Jumlah Item",
                                    fillColor: Colors.white,
                                    border: new OutlineInputBorder(
                                      borderRadius: new BorderRadius.circular(25.0),
                                      borderSide: new BorderSide(
                                      ),
                                    ),
                                  ),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[WhitelistingTextInputFormatter.digitsOnly],
                                  onSaved:(value){
                                    jumlah=value;
                                  } ,

                                ),
                                SizedBox(height: 20),
                                TextFormField(
                                  validator: (value){
                                    if(value.isEmpty){
                                      return 'Tidak boleh null';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: "Satuan",
                                    fillColor: Colors.white,
                                    border: new OutlineInputBorder(
                                      borderRadius: new BorderRadius.circular(25.0),
                                      borderSide: new BorderSide(
                                      ),
                                    ),
                                  ),
                                  onSaved:(value){
                                    satuan=value;
                                  } ,

                                ),
                                SizedBox(height: 20),



                              ],
                            )
                        )
                    ),
                    SizedBox(height: 20),
                  ],
                ),
            ),
            floatingActionButton: Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[

                  FloatingActionButton.extended(
                      heroTag: "btn1",
                      icon: Icon(Icons.add_shopping_cart),
                      label: Text("Tambah"),

                      onPressed: (){
                        if(_formKey.currentState.validate()){
                          _formKey.currentState.save();

                          BlocProvider.of<AddPermintaanBloc>(context).add(
                            //masukkan ke dalam bloc
                              AddToCartEvent(Permintaan(atkName: atkName,satuan: satuan,jumlah: int.parse(jumlah)))
                          );
                          _formKey.currentState.reset();


                        }
                      }
                  ),
                  SizedBox(width: 20),

                  Badge(

                    badgeContent: Text('$countItem',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    position: BadgePosition.topLeft(top: -10,left: -3),
                    child: FloatingActionButton.extended(
                      heroTag: "btn2",
                      label: Row(
                        children: <Widget>[
                          Text("Daftar Pengajuan"),
                          SizedBox(width: 2.5),
                        ],
                      ),
                      icon: Icon(Icons.navigate_next),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CartListScreen()),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }


      }

    );
  }


}


Widget atkListForm(String atkName){
  List daftarAtk=["buku","pulpen","kertasa"];
  return DropdownButtonFormField(
      value: atkName,
      hint: Text("Pilih Alat Tulis Kantor"),
      items:daftarAtk.map((val){
        return DropdownMenuItem(
          child: Text(val),
          value: val,
        );
      }).toList(),
      onChanged: (value){
      }
  );
}
