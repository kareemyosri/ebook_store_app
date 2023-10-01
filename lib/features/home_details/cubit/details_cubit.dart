
import 'package:bloc/bloc.dart';
import 'package:book_store_app/core/database/remoteDatabase/DioHelper.dart';
import 'package:book_store_app/core/database/remoteDatabase/endpoints.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit() : super(DetailsInitial());
  static DetailsCubit get(context)=>BlocProvider.of(context);

  addToCart({required String id}){
    emit(AddToCartLoadingState());
    DioHelper.PostData(url: addToCartUrl,data: {
      'product_id':id
    })
        .then((value)  {
          emit(AddToCartSuccessfullyState());
    })
        .catchError((error){
          print(error.toString());
          emit(AddToCartErrorState());
    });
  }

}
