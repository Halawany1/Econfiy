import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:econfiy/shared/constant/api.dart';
import 'package:econfiy/shared/constant/app.dart';
import 'package:econfiy/shared/network/local.dart';
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
      emit(SuccessUserLoginState());
      CacheHelper.saveData(key: AppConstant.token,
          value: value.data['data']['token']);
      //print(value.data['data']['token']);
    }).catchError((error){
      if(error is DioError){
        emit(ErrorUserLoginState(error.response!.data["massage"]));
      }else{
        emit(ErrorUserLoginState(error));
      }
    });

  }

  void userSignUp({
    required String email,
    required String name,
    required String password,
  }){
    emit(LoadingUserRegisterState());
    DioHelper.postData(url: ApiConstant.register,
        data: {
          "email":email,
          "name":name,
          "password":password
        }).then((value) {
      emit(SuccessUserRegisterState());
      CacheHelper.saveData(key: AppConstant.token,
          value: value.data['data']['token']);
      //print(value.data['data']['token']);
    }).catchError((error){
      if(error is DioError){
        emit(ErrorUserRegisterState(error.response!.data["massage"]));
      }else{
        emit(ErrorUserRegisterState(error));
      }
    });

  }
}
