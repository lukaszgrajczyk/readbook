import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'root_page_state.dart';

class RootPageCubit extends Cubit<RootPageState> {
  RootPageCubit()
      : super(
          RootPageState(
            user: null,
            isLoading: false,
            errorMessage: '',
          ),
        );

  StreamSubscription? _subscription;

  Future<void> start() async {
    emit(
      RootPageState(user: null, isLoading: true, errorMessage: ''),
    );

    _subscription = FirebaseAuth.instance.authStateChanges().listen(
      (User? user) {
        emit(
          RootPageState(user: user, isLoading: false, errorMessage: ''),
        );
      },
      onError: (error) {
        emit(
          RootPageState(user: null, isLoading: false, errorMessage: ''),
        );
      },
    );
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    return super.close();
  }
}
