part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthLoadingST extends AuthenticationState {}

class IsLoggedInST extends AuthenticationState {
  final bool isLoggedIn;

  const IsLoggedInST({required this.isLoggedIn});

  @override
  List<Object> get props => [isLoggedIn];
}
