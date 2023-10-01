import 'package:bloc/bloc.dart';
import 'package:book_store_app/core/database/remoteDatabase/DioHelper.dart';
import 'package:book_store_app/core/database/remoteDatabase/endpoints.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../model/cartModel.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  static CartCubit get(context) => BlocProvider.of(context);
  List<CartItems> cartItems = [];
  CartModel? cartModel;
  getCartItems() {
    emit(GetCartItemsLoadingState());
    cartItems.clear();
    DioHelper.getData(url: getCartUrl).then((value) {
      cartModel = CartModel.fromJson(value.data);
      for (var element in value.data['data']['cart_items']) {
        cartItems.add(CartItems.fromJson(element));
      }
      emit(GetCartItemsSuccessfullyState());
    }).catchError((error) {
      print(error.toString());
      emit(GetCartItemsErrorState());
    });
  }

  removeItem({required String itemId}) {
    emit(RemoveItemLoadingState());
    DioHelper.PostData(url: removeItemCartUrl, data: {'cart_item_id': itemId})
        .then((value) {
      emit(RemoveItemSuccessfullyState());
    }).catchError((error) {
      print(error.toString());
      emit(RemoveItemErrorState());
    });
  }

  updateItem({required String itemId, required String itemCount}) {
    emit(UpdateItemLoadingState());
    DioHelper.PostData(url: updateItemCartUrl, data: {
      'cart_item_id': itemId,
      'quantity': itemCount,
    }).then((value) {
      getCartItems();
      emit(UpdateItemSuccessfullyState());
    }).catchError((error) {
      print(error.toString());
      emit(UpdateItemErrorState());
    });
  }
}
