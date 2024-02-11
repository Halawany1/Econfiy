import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  int currentImageIndex=0;
  void changeImageIndex(int index){
    currentImageIndex=index;
    emit(ChangeImageIndexState());
  }
}
