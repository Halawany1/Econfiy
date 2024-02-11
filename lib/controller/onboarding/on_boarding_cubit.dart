import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitial());

  int index=1;
  void changeCurrentScreen(int current){
    index=current;
    emit(ChangeCurrentScreenState());
  }
}
