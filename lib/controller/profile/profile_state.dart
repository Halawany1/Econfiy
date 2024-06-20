part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

class ProfileInitial extends ProfileState {}

class LoadingGetProfileState extends ProfileState {}

class SuccessGetProfileState extends ProfileState {

}

class ErrorGetProfileState extends ProfileState {

}
class LoadingUpdateProfileState extends ProfileState {}

class SuccessUpdateProfileState extends ProfileState {

}

class ErrorUpdateProfileState extends ProfileState {
  final String error;

  ErrorUpdateProfileState(this.error);

}

