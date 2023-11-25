import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_network_connectivity_check/Cubit/internet_state.dart';

class InternetCubit extends Cubit<InternetStateCubit> {
  Connectivity connectivity = Connectivity();
  StreamSubscription? connectionCheck;

  InternetCubit() : super(InternetStateCubit.Initial) {
    connectionCheck = connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        emit(InternetStateCubit.Gained);
      } else {
        emit(InternetStateCubit.Lost);
      }
    });
  }

  @override
  Future<void> close() {
    connectionCheck?.cancel();
    return super.close();
  }
}
