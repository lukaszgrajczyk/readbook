import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
part 'login_page_state.dart';

class LoginPageCubit extends Cubit<LoginPageState> {
  LoginPageCubit()
      : super(
          LoginPageState(
            email: '',
            password: '',
            errorMessage: null,
          ),
        );

  Future<void> signIn(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (error) {
      emit(
        LoginPageState(
          email: email,
          password: password,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
