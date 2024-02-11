import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());
  bool check=false;
  void changeCheckBox(bool value){
    check=value;
    emit(ChangeCheckBoxState());
  }
  bool visibality=false;
  void changeVisibalityPassword(){
    visibality=!visibality;
    emit(ChangeVisibalityPasswordState());
  }
}
