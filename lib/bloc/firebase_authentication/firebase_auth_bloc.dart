import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:ecommerce/data/repository/firebase_repository/authentiacation_repository.dart';
import 'package:ecommerce/data/repository/user_repository.dart';
import 'package:ecommerce/resource/di.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'firebase_auth_event.dart';

part 'firebase_auth_state.dart';

AuthRepo _authRepo = sl.get<AuthRepo>();
UserRepo _userRepo = sl.get<UserRepo>();

class FirebaseAuthBloc extends Bloc<FirebaseAuthEvent, FirebaseAuthState> {
  FirebaseAuthBloc() : super(FirebaseAuthInitial()) {
    on<FireBaseSignInET>(singInMethod);
    on<FireBaseLoginET>(loginMethod);
  }

  FutureOr<void> singInMethod(
      FireBaseSignInET event, Emitter<FirebaseAuthState> emit) async {
    emit(const FireBaseLoadingST(isLoading: true));

    String email = event.email;
    String password = event.password;
    String confirmedPassword = event.confirmedPassword;
    try {
      if (email.isNotEmpty &&
          password.isNotEmpty &&
          confirmedPassword.isNotEmpty &&
          password == confirmedPassword) {
        User? user = await _authRepo.signUp(event.email, event.password);

        if (user != null) {
          emit(const FireBaseLoadingST(isLoading: false));
          emit(FireBaseAuthSuccessST());
        }
      } else if (email.isEmpty ||
          password.isEmpty ||
          confirmedPassword.isEmpty) {
        emit(const FireBaseLoadingST(isLoading: false));
        emit(const FireBaseAuthErrorST(errMsg: 'Fill all the credentials'));
      } else if (password != confirmedPassword) {
        emit(const FireBaseLoadingST(isLoading: false));
        emit(const FireBaseAuthErrorST(errMsg: 'Passwords does not match'));
      }
    } catch (e) {
      emit(const FireBaseLoadingST(isLoading: false));
      log('in firebase bloc ${e.toString()}');
      emit(FireBaseAuthErrorST(errMsg: e.toString()));
    }
  }

  FutureOr<void> loginMethod(
      FireBaseLoginET event, Emitter<FirebaseAuthState> emit) async {
    String email = event.email;
    String password = event.password;
    emit(const FireBaseLoadingST(isLoading: true));
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        User? user = await _authRepo.login(event.email, event.password);

        if (user != null) {
          log(user.uid);
          emit(const FireBaseLoadingST(isLoading: false));
          await _userRepo.setIsLogin(true);
          emit(FireBaseAuthSuccessST());
        }
      } else if (email.isEmpty || password.isEmpty) {
        emit(const FireBaseLoadingST(isLoading: false));
        emit(const FireBaseAuthErrorST(errMsg: 'Fill all the credentials'));
      }
    } catch (e) {
      emit(const FireBaseLoadingST(isLoading: false));
      log('in firebase bloc ${e.toString()}');
      emit(FireBaseAuthErrorST(errMsg: e.toString()));
    }
  }
}
