part of 'firebase_auth_bloc.dart';

abstract class FirebaseAuthEvent extends Equatable {
  const FirebaseAuthEvent();

  @override
  List<Object> get props => [];
}

class FireBaseSignInET extends FirebaseAuthEvent {
  final String email, password, confirmedPassword;

  const FireBaseSignInET(
      {required this.email,
      required this.password,
      required this.confirmedPassword});

  @override
  List<Object> get props => [email, password, confirmedPassword];
}

class FireBaseLoginET extends FirebaseAuthEvent {
  final String email, password;

  const FireBaseLoginET({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}
