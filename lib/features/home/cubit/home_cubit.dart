import 'package:bloc/bloc.dart';
import 'package:book_store_app/core/database/remoteDatabase/endpoints.dart';
import 'package:book_store_app/features/home/model/productModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/database/remoteDatabase/DioHelper.dart';
import '../model/get_all_categoriesModel.dart';
import '../model/sliderModel.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context)=>BlocProvider.of(context);




  SliderModel? sliderModel;
  List<String?> images=[];

  void getSlider(){
    emit(GetSliderLoadingState());
     DioHelper.getData(url: sliderUrl).then((value){
      sliderModel=SliderModel.fromJson(value.data);
      for(var element in value.data['data']['sliders']){
        images.add(Sliders.fromJson(element).image);
      }
     // print(value.data);
      emit(GetSliderSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetSliderErrorState());
    });

  }

  ProductModel? productModel;
  List<Products> bestSeller=[];
  void getBestSeller(){
    emit(GetBestSellerLoadingState());
    DioHelper.getData(url: bestSellerUrl).then((value){
      productModel=ProductModel.fromJson(value.data);
      for(var element in value.data['data']['products']){
        bestSeller.add(Products.fromJson(element));
      }
      //print(value.data);
      emit(GetBestSellerSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetBestSellerErrorState());
    });

  }

  List<Products> newArrivals=[];
  void getNewArrivals(){
    emit(GetNewArrivalsLoadingState());
    DioHelper.getData(url: newArrivalsUrl).then((value){
      for(var element in value.data['data']['products']){
        newArrivals.add(Products.fromJson(element));
      }
      //print(value.data);
      emit(GetNewArrivalsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetNewArrivalsErrorState());
    });

  }

  List<AllCategories> allCategories=[];
  void getAllCategories(){
    emit(GetAllCategoriesLoadingState());
    DioHelper.getData(url: getAllCategoriesUrl).then((value){
      for(var element in value.data['data']['categories']){
        allCategories.add(AllCategories.fromJson(element));
      }
      print(value.data);
      emit(GetAllCategoriesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetAllCategoriesErrorState());
    });

  }

}
