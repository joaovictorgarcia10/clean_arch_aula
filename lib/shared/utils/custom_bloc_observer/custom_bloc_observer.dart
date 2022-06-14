// ignore_for_file: avoid_print
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    print("\n__________________TRANSITION__________________\n");
    print(bloc.toString());
    print(transition.toString());
    print("\n");

    super.onTransition(bloc, transition);
  }
}
