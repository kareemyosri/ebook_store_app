import 'package:bloc/bloc.dart';
import 'package:book_store_app/core/database/remoteDatabase/endpoints.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/database/remoteDatabase/DioHelper.dart';
import '../model/sliderModel.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context)=>BlocProvider.of(context);




  SliderModel? sliderModel;

  void getSlider(){
    emit(GetSliderLoadingState());
     DioHelper.getData(url: sliderUrl).then((value){
      sliderModel=SliderModel.fromJson(value.data);
      print(value.data);
      emit(GetSliderSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetSliderErrorState());
    });

  }


}
