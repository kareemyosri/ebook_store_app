import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/database/remoteDatabase/DioHelper.dart';
import '../../../core/database/remoteDatabase/endpoints.dart';
import '../../home/model/productModel.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit() : super(FavouriteInitial());

  static FavouriteCubit get(context)=>BlocProvider.of(context);
  List<Products> favouriteItems=[];

  void getFavouriteItems() {
    emit(GetFavouriteItemsLoadingState());
    DioHelper.getData(url:getFavouriteItemsUrl).then((value) {
      //print(value.data);

      for (var element in value.data['data']['data']) {
        favouriteItems.add(Products.fromJson(element));
      }
      emit(GetFavouriteItemsSuccessfullyState());
    }).catchError((error) {
      print(error.toString());
      emit(GetFavouriteItemsErrorState());
    });
  }

}
