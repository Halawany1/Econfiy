part of 'authentication_cubit.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}


class ChangeVisibalityPasswordState extends AuthenticationState {}

class ChangeCheckBoxState extends AuthenticationState {}
