
import 'package:atktemp/bloc/add_permintaan_event.dart';
import 'package:atktemp/bloc/add_permintaan_state.dart';
import 'package:atktemp/model/permintaan.dart';
import 'package:atktemp/repository/permintaan_repository.dart';
import 'package:bloc/bloc.dart';


class AddPermintaanBloc extends Bloc<AddPermintaanEvent,AddPermintaanState>{

  @override
  // TODO: implement initialState
  //List<Permintaan> permintaans= [];
  AddPermintaanState get initialState => CartInitiated();

  @override
  Stream<AddPermintaanState> mapEventToState(AddPermintaanEvent event) async* {

      final currentState=state;


    if(event is LoadCart){
      List<Permintaan> permintaans= [];
      String atkName;
      int countCart=0;

      if(currentState is CartInitiated){
        print('initiated....');
        yield CartLoaded(permintaans,atkName,countCart: countCart);
      }
      yield CartLoaded(permintaans,atkName,countCart:countCart);
    }
    if(event is AddToCartEvent){
        if(currentState is CartLoaded){
          List<Permintaan> newPermintaan= List.from(currentState.permintaans);

          if(event.permintaan !=null){
            print("add permintaan to list");
            newPermintaan.add(event.permintaan);
            String atkName;
            int count=newPermintaan.length;
            yield CartLoaded(newPermintaan,atkName,countCart: count);
          }
        }

    }
    if(event is SelectAtkEvent){
      if(currentState is CartLoaded){
          if(event.atkName != null){
            String atkName=event.atkName;
            print("atk selected: $atkName");
            yield CartLoaded(currentState.permintaans,event.atkName,countCart: currentState.countCart);
          }
      }
    }
    if(event is SubmitAtkEvent) {
      print("submitted");
        yield* _mapSubmitPermintaanEventToState(event);
      }
    }


    Stream<AddPermintaanState> _mapSubmitPermintaanEventToState(SubmitAtkEvent event) async*{
      PermintaanRepository _permintaanRepository=PermintaanRepository();
    List<Permintaan> permintaan = event.permintaans;
    print("stream  $permintaan");
       _permintaanRepository.storePermintaanCart(permintaan);
    }
  }

