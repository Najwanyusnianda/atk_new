

import 'package:flutter_bloc/flutter_bloc.dart';

class AddPermintaanDelegate extends BlocDelegate{
  @override
  void onEvent(Bloc bloc, Object event) {
    // TODO: implement onEvent
    super.onEvent(bloc, event);
    
    print('event run $event');
  }
  
  @override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onTransition
    super.onTransition(bloc, transition);

    print("transition: $transition");
  }
  
  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    // TODO: implement onError
    super.onError(bloc, error, stacktrace);
    print("error: $error");
  }
}