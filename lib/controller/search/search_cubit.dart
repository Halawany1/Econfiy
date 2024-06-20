import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:econfiy/models/search_product_model.dart';
import 'package:econfiy/shared/constant/api.dart';
import 'package:econfiy/shared/constant/app.dart';
import 'package:econfiy/shared/network/local.dart';
import 'package:econfiy/shared/network/remote.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  static SearchCubit get(context) => BlocProvider.of(context);

  SearchProductModel? searchProductModel;
  void search(String url){
    emit(LoadingSearchState());
   DioHelper.getData(url: ApiConstant.fetchUrl,
     token: CacheHelper.getData(key: AppConstant.token),
     query: {
       "url":url
     }
   ).then((value) {
     searchProductModel = SearchProductModel.fromJson(value.data);
     emit(SuccessSearchState());
   }).catchError((error){
     if(error is DioError){
       print(error.response!.data);
       emit(ErrorSearchState(error.response!.data["message"]));
     }else{
       emit(ErrorSearchState(error.toString()));
     }
   });
  }

}
