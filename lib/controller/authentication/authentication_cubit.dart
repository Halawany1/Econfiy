import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:econfiy/shared/constant/api.dart';
import 'package:econfiy/shared/network/remote.dart';
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

  void userLogin({
    required String email,
    required String password,
}){
    emit(LoadingUserLoginState());
    DioHelper.postData(url: ApiConstant.login,
        data: {
          "email":email,
          "password":password
    }).then((value) {
      if(value.data["error"]!=0){
        emit(SuccessUserLoginState());
      }else{
        emit(ErrorUserLoginState(value.data["message"]));
      }

    }).catchError((error){
      if(error is DioError){
        emit(ErrorUserLoginState(error.response!.data["message"]));
      }else{
        emit(ErrorUserLoginState(error));
      }
    });

  }
}
