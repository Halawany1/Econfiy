part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class ChangeIndexCourselSliderState extends HomeState {}

class LoadingGetProductsState extends HomeState {}

class SuccessGetProductsState extends HomeState {}

class ErrorGetProductsState extends HomeState {}

class LoadingGetRecommendProductState extends HomeState {}

class SuccessGetRecommendProductState extends HomeState {}

class ErrorGetRecommendProductState extends HomeState {}


class LoadingGetProductByIdState extends HomeState {}

class SuccessGetProductByIdState extends HomeState {}

class ErrorGetProductByIdState extends HomeState {}

class LoadingGetReviewsState extends HomeState {}

class SuccessGetReviewsState extends HomeState {}

class ErrorGetReviewsState extends HomeState {}

class LoadingGetReviewAnalysisState extends HomeState {}

class SuccessGetReviewAnalysisState extends HomeState {}

class ErrorGetReviewAnalysisState extends HomeState {}

class LoadingPostFavouritesState extends HomeState {}

class SuccessPostFavouritesState extends HomeState {}

class ErrorPostFavouritesState extends HomeState {}

class LoadingDeleteFavouritesState extends HomeState {}

class SuccessDeleteFavouritesState extends HomeState {}

class ErrorDeleteFavouritesState extends HomeState {}


class LoadingGetRecentProductsState extends HomeState {}

class SuccessGetRecentProductsState extends HomeState {}

class ErrorGetRecentProductsState extends HomeState {}

class LoadingGetFacouritesState extends HomeState {}

class SuccessGetFacouritesState extends HomeState {}

class ErrorGetFacouritesState extends HomeState {}