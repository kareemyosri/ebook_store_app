import 'package:bloc/bloc.dart';
import 'package:book_store_app/features/order_history/model/historyModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/database/remoteDatabase/DioHelper.dart';
import '../../../core/database/remoteDatabase/endpoints.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit() : super(HistoryInitial());
  static HistoryCubit get(context)=>BlocProvider.of(context);
  List<Orders> orders=[];
  getOrderHistory() {
    emit(GetOrderHistoryLoading());

    DioHelper.getData(url: orderHistoryUrl).then((value) {
      for (var element in value.data['data']['orders']) {
        orders.add(Orders.fromJson(element));
      }
      emit(GetOrderHistorySuccessfully());
    }).catchError((error) {
      print(error.toString());
      emit(GetOrderHistoryError());
    });
  }
}
