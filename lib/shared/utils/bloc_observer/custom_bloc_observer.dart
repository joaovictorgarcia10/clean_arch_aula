// ignore_for_file: avoid_print
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    print("\n*** BLOC OBSERVER TRANSITION ***\n");
    print(bloc.toString());
    print(transition.toString());
    print("\n");

    super.onTransition(bloc, transition);
  }
}
