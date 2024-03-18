part of 'firebase_auth_bloc.dart';

abstract class FirebaseAuthState extends Equatable {
  const FirebaseAuthState();

  @override
  List<Object> get props => [];
}

class FirebaseAuthInitial extends FirebaseAuthState {}

class FireBaseLoadingST extends FirebaseAuthState {
  final bool isLoading;

  const FireBaseLoadingST({required this.isLoading});

  @override
  List<Object> get props => [isLoading];
}

class FireBaseAuthSuccessST extends FirebaseAuthState {}

class FireBaseAuthErrorST extends FirebaseAuthState {
  final String errMsg;

  const FireBaseAuthErrorST({required this.errMsg});

  @override
  List<Object> get props => [errMsg];
}

class FireBaseClearST extends FirebaseAuthState {}
