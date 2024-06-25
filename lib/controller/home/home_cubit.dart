import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:econfiy/models/analysis_model.dart';
import 'package:econfiy/models/favourite_model.dart';
import 'package:econfiy/models/product_by_id_model.dart';
import 'package:econfiy/models/product_model.dart';
import 'package:econfiy/models/recent_product_model.dart';
import 'package:econfiy/models/reviews_model.dart';
import 'package:econfiy/shared/constant/api.dart';
import 'package:econfiy/shared/constant/app.dart';
import 'package:econfiy/shared/network/local.dart';
import 'package:econfiy/shared/network/remote.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);


  int currentIndex = 0;

  void changeIndexCourselSlider(int index) {
    currentIndex = index;
    emit(ChangeIndexCourselSliderState());
  }

  ProductModel? productModel;
  List<ProductData>allProducts = [];
  List<ProductData>recommend = [];

  void getProducts() {
    emit(LoadingGetProductsState());
    DioHelper.getData(url: ApiConstant.product,
      token: CacheHelper.getData(key: AppConstant.token),
    ).then((value) {
      productModel = ProductModel.fromJson(value.data);
      allProducts.clear();
      for (var element in productModel!.data!.products!.data!) {
        allProducts.add(element);
      }
      emit(SuccessGetProductsState());
    }).catchError((error) {
      emit(ErrorGetProductsState());
    });
  }


  void getRecommendProducts() {
    emit(LoadingGetRecommendProductState());
    DioHelper.getData(url: ApiConstant.product,
      token: CacheHelper.getData(key: AppConstant.token),
    ).then((value) {
      productModel = ProductModel.fromJson(value.data);
      recommend.clear();
      for (var element in productModel!.data!.products!.data!) {
        recommend.add(element);
      }
      emit(SuccessGetRecommendProductState());
    }).catchError((error) {
      if (error is DioError) {
        print(error.response!.data);
      } else {
        print(error);
      }
      emit(ErrorGetRecommendProductState());
    });
  }

  ProductByIdtModel? productByIdModel;

  void getProductById(int id) {
    emit(LoadingGetProductByIdState());
    DioHelper.getData(url: ApiConstant.productById(id),
      token: CacheHelper.getData(key: AppConstant.token),
    ).then((value) {
      productByIdModel = ProductByIdtModel.fromJson(value.data);
      emit(SuccessGetProductByIdState());
    }).catchError((error) {
      emit(ErrorGetProductByIdState());
    });
  }

  ReviewsModel? reviewsModel;
  void getAllReviews(int id) {
    emit(LoadingGetReviewsState());
    DioHelper.getData(url: ApiConstant.reviews,
      token: CacheHelper.getData(key: AppConstant.token),
      query: {
        "product_id":id
      }
    ).then((value) {
      reviewsModel = ReviewsModel.fromJson(value.data);
      emit(SuccessGetReviewsState());
    }).catchError((error) {
      emit(ErrorGetReviewsState());
    });
  }

  AnalysisModel? analysisModel;
  void getReviewAnalysis(int id) {
    emit(LoadingGetReviewAnalysisState());
    DioHelper.getData(url: ApiConstant.reviewAnalysis,
      token: CacheHelper.getData(key: AppConstant.token),
      query: {
        "product_id":id
      }
    ).then((value) {
      analysisModel = AnalysisModel.fromJson(value.data);
      emit(SuccessGetReviewAnalysisState());
    }).catchError((error) {
      emit(ErrorGetReviewAnalysisState());
    });
  }
  void postFavourites(int id) {
    emit(LoadingPostFavouritesState());
    DioHelper.postData(url: ApiConstant.favourites,
      token: CacheHelper.getData(key: AppConstant.token),
      data: {
        "product_id":id
      }
    ).then((value) {
      emit(SuccessPostFavouritesState());
      getProducts();
      getRecommendProducts();
      getRecentProducts();
      getFavourites();
    }).catchError((error) {
      emit(ErrorPostFavouritesState());
    });
  }
  void deleteFavourites(int id) {
    emit(LoadingDeleteFavouritesState());
    DioHelper.deleteData(url: ApiConstant.favourites,
      token: CacheHelper.getData(key: AppConstant.token),
      query: {
        "product_id":id
      }
    ).then((value) {
      emit(SuccessDeleteFavouritesState());
      getProducts();
      getRecommendProducts();
      getRecentProducts();
      getFavourites();
    }).catchError((error) {
      emit(ErrorDeleteFavouritesState());
    });
  }

  RecentProductModel? recentProductModel;
  void getRecentProducts() {
    emit(LoadingGetRecentProductsState());
    DioHelper.getData(url: ApiConstant.recent,
      token: CacheHelper.getData(key: AppConstant.token),
    ).then((value) {
      recentProductModel = RecentProductModel.fromJson(value.data);
      emit(SuccessGetRecentProductsState());
    }).catchError((error) {
      emit(ErrorGetRecentProductsState());
    });
  }
  FavouriteModel? favouriteModel;
  void getFavourites() {
    emit(LoadingGetFacouritesState());
    DioHelper.getData(url: ApiConstant.favourites,
      token: CacheHelper.getData(key: AppConstant.token),
    ).then((value) {
      favouriteModel = FavouriteModel.fromJson(value.data);
      emit(SuccessGetFacouritesState());
    }).catchError((error) {
      emit(ErrorGetFacouritesState());
    });
  }

}