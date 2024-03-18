import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:ecommerce/data/repository/user_repository.dart';
import 'package:equatable/equatable.dart';

import '../../resource/di.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

UserRepo _userRepo = sl.get<UserRepo>();

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<CheckAuthenticationET>(checkAuthMethod);
  }

  FutureOr<void> checkAuthMethod(
      CheckAuthenticationET event, Emitter<AuthenticationState> emit) async {
    bool? isLoggedIn;

    isLoggedIn = await _userRepo.getLogin();

    if (isLoggedIn == true) {
      emit(const IsLoggedInST(isLoggedIn: true));
    } else {
      emit(const IsLoggedInST(isLoggedIn: false));
    }
  }
}
