import 'package:atktemp/bloc/add_permintaan_bloc.dart';
import 'package:atktemp/bloc/add_permintaan_event.dart';
import 'package:atktemp/bloc/add_permintaan_state.dart';
import 'package:atktemp/model/permintaan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




class AtkRequestList extends StatelessWidget {
  List<Permintaan> listPermintaan=[];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: BlocConsumer<AddPermintaanBloc,AddPermintaanState>(
        builder: (context,state){
          if(state is CartInitiated){
            return Text('loading');
          }
          if(state is CartLoaded){
            listPermintaan= state.permintaans;
            if(listPermintaan.isNotEmpty){
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      padding: EdgeInsets.all(16),
                      itemCount: listPermintaan.length,
                      itemBuilder:(context,index){
                        return Card(
                          /*child: ListTile(
                          title: Text(listPermintaan[index].atkName ?? ""),
                        ),*/
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                leading: Icon(Icons.check_circle),
                                dense: true,
                                title: Text(listPermintaan[index].atkName ?? " "),
                                subtitle:Row(
                                  children: <Widget>[
                                    Text(listPermintaan[index].jumlah.toString()),
                                    SizedBox(width: 5),
                                    Text(listPermintaan[index].satuan)
                                  ],
                                ),
                                trailing:  Icon(Icons.delete,
                                    color: Colors.redAccent),
                                onTap: (){
                                  print("tap");
                                },
                              ),

                            ],
                          ),
                        );
                      } ,
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 50,
                      child: RaisedButton(
                        child: Text(
                          "Kirim Permintaan",
                          style: Theme.of(context).textTheme.button.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          BlocProvider.of<AddPermintaanBloc>(context).add(
                            SubmitAtkEvent(listPermintaan)
                          );
                        },
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                  )
                ],
              );
            }else{
              return Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Belum ada Permintaan")
                      ],
                    )

                  ],
                ),
              );
            }

          }

        },
        listener: (BuildContext context,state){

        },
      )
    );
  }
}
