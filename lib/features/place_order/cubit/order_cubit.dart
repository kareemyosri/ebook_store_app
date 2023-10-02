import 'package:bloc/bloc.dart';
import 'package:book_store_app/core/database/remoteDatabase/DioHelper.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/database/remoteDatabase/endpoints.dart';
import '../model/checkoutModel.dart';
import '../model/governorateModel.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());
  static OrderCubit get(context)=>BlocProvider.of(context);
  CheckoutModel? checkoutModel;
  List<CartItems> items=[];
  void checkout(){
    emit(CheckoutLoading());
    DioHelper.getData(url: checkoutUrl)
        .then((value) {
          checkoutModel=CheckoutModel.fromJson(value.data);
          for(var element in value.data['data']['cart_items']){
            items.add(CartItems.fromJson(element));
    }
          emit(CheckoutSuccessfully());
    })
        .catchError((error){
          print(error.toString());
          emit(CheckoutError());
    });
}

  List<GovernoratesData> governorates=[];
  void getGovernorate(){
    emit(GetGovernorateLoading());
    DioHelper.getData(url: getGovernorateUrl)
        .then((value) {
      for(var element in value.data['data']){
        governorates.add(GovernoratesData.fromJson(element));
      }
      emit(GetGovernorateSuccessfully());
    })
        .catchError((error){
      print(error.toString());
      emit(GetGovernorateError());
    });
  }

  late String selectedGovernorateId;
  updateId(String value){
    selectedGovernorateId=value;
    emit(UpdateSelectedId());
  }

  placeOrder({
    required String phone,
    required String address,

}){
    emit(PlaceOrderLoading());
    DioHelper.PostData(url: placeOrderUrl,data: {
      'name':checkoutModel?.data?.user?.userName,
      'governorate_id':selectedGovernorateId,
      'phone':phone,
      'address':address,
      'email':checkoutModel?.data?.user?.userEmail
    }).then((value) {
      emit(PlaceOrderSuccessfully());
    }).catchError((error){
      print(error.toString());
      emit(PlaceOrderError());
    });
  }



}
