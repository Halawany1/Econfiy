part of 'authentication_cubit.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}


class ChangeVisibalityPasswordState extends AuthenticationState {}

class ChangeCheckBoxState extends AuthenticationState {}

class LoadingUserLoginState extends AuthenticationState {}

class SuccessUserLoginState extends AuthenticationState {}

class ErrorUserLoginState extends AuthenticationState {

  final String error;
  ErrorUserLoginState(this.error);
}
class LoadingUserRegisterState extends AuthenticationState {}

class SuccessUserRegisterState extends AuthenticationState {}

class ErrorUserRegisterState extends AuthenticationState {

  final String error;
  ErrorUserRegisterState(this.error);
}

