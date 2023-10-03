
import 'package:book_store_app/core/database/remoteDatabase/DioHelper.dart';
import 'package:book_store_app/core/database/remoteDatabase/endpoints.dart';
import 'package:book_store_app/features/home/model/productModel.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  static SearchCubit get(context) => BlocProvider.of(context);

  bool isSearching = false;

  void searchTextChanged(String text) {
    if (text.isEmpty) {
      isSearching = false;
    } else {
      isSearching = true;
    }
  }

  List<Products> foundResults = [];
  void searchProduct({required String name}) {
    foundResults.clear();
    searchTextChanged(name);
    emit(SearchLoading());

    DioHelper.getData(url: '$searchProductUrl$name').then((value) {
      for (var product in value.data['data']['products']) {
        foundResults.add(Products.fromJson(product));
      }
      if (foundResults.isEmpty) {
        emit(SearchEmpty());
      } else {
        emit(SearchLoaded());
      }
    }).catchError((error) {
      print(error);
      emit(SearchError());
    });
  }

  fetchDataWithFilters({
    String? max,
    String? min,
    String? search,
    String? isBestSeller,
    String? categoryId,
    String? limit,
  })  {
    foundResults.clear();

    emit(FilterLoading());
    DioHelper.getData(url: filterUrl
        ,query:{
        'max': max,
        'min': min,
        'search': search,
        'is_bestseller': isBestSeller,
        'category_id': categoryId,
        'limit': limit,
      },)

        .then((value) {
      for (var product in value.data['data']['products']) {
        foundResults.add(Products.fromJson(product));
      }
      if (foundResults.isEmpty) {
        emit(SearchEmpty());
      } else {
        emit(FilterSuccess());
      }
    })
        .catchError((error){
          print(error.toString());
          emit(FilterError());
    });
  }


  RangeValues selectedRange =  const RangeValues(0, 1000);

  changeRange(RangeValues values){
   // emit(ChangeRangeValues());

    selectedRange=values;
    emit(ChangeRangeValues());
  }
    
}
