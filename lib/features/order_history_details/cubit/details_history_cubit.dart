import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/database/remoteDatabase/DioHelper.dart';
import '../../../core/database/remoteDatabase/endpoints.dart';
import '../model/single_orderModel.dart';

part 'details_history_state.dart';

class DetailsHistoryCubit extends Cubit<DetailsHistoryState> {
  DetailsHistoryCubit() : super(DetailsHistoryInitial());

  static DetailsHistoryCubit get(context)=>BlocProvider.of(context);
  List<OrderProducts> items=[];
  SingleOrderModel? singleOrderModel;
  showOrder( String id) {
    emit(ShowOrderLoading());

    DioHelper.getData(url: '$showOrderUrl$id').then((value) {
      singleOrderModel=SingleOrderModel.fromJson(value.data);
      for (var element in value.data['data']['order_products']) {
        items.add(OrderProducts.fromJson(element));
      }
      emit(ShowOrderSuccessfully());
    }).catchError((error) {
      print(error.toString());
      emit(ShowOrderSuccessfully());
    });
  }

}
