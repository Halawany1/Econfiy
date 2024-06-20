import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:econfiy/models/profile_model.dart';
import 'package:econfiy/shared/constant/api.dart';
import 'package:econfiy/shared/constant/app.dart';
import 'package:econfiy/shared/network/local.dart';
import 'package:econfiy/shared/network/remote.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  static ProfileCubit get(context) => BlocProvider.of(context);

  ProfileModel? profileModel;
  void getProfile(){
    emit(LoadingGetProfileState());
    DioHelper.getData(url: ApiConstant.profile,
    token: CacheHelper.getData(key: AppConstant.token),).
    then((value){
      profileModel = ProfileModel.fromJson(value.data);
      emit(SuccessGetProfileState());
    }).catchError((error){
      emit(ErrorGetProfileState());
    });
  }

  void updateProfile({required int id,
    required String name,
    required String email,}){
    emit(LoadingUpdateProfileState());
    DioHelper.putData(url: ApiConstant.updateProfile(id),
    data: {
      "name":name,
      "email":email
    },
    token: CacheHelper.getData(key: AppConstant.token),).
    then((value){
      emit(SuccessUpdateProfileState());
      getProfile();
    }).catchError((error){
      if(error is DioError){
        emit(ErrorUpdateProfileState(error.response!.data['message']));
      }else{
        emit(ErrorUpdateProfileState(error.toString()));
      }

    });
  }
}
