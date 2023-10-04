import 'package:book_store_app/core/database/remoteDatabase/DioHelper.dart';
import 'package:book_store_app/core/database/remoteDatabase/endpoints.dart';
import 'package:book_store_app/features/home/model/productModel.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial()) {
    minRange = 0;
    maxRange = 1000;
    selectedRange = RangeValues(minRange, maxRange);
  }
  static SearchCubit get(context) => BlocProvider.of(context);

  bool isSearching = false;
  late String searchKey;
  void searchTextChanged(String text) {
    searchKey = text;
    if (text.isEmpty) {
      isSearching = false;
    } else {
      isSearching = true;
    }
  }

  List<Products> foundResults = [];
  void searchProduct({required name}) {
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
    String? isBestSeller,
    String? categoryId,
    String? limit,
  }) {
    foundResults.clear();

    emit(SearchLoading());
    DioHelper.getData(
      url: filterUrl,
      query: {
        'min': selectedRange.start,
        'max': selectedRange.end,
        'search': searchKey,
        'is_bestseller': isBestSeller,
        'category_id': selectedCategoryId,
        'limit': limit,
      },
    ).then((value) {
      print(value.data);
      for (var product in value.data['data']['products']) {
        foundResults.add(Products.fromJson(product));
      }
      if (foundResults.isEmpty) {
        emit(SearchEmpty());
      } else {
        emit(SearchLoaded());
      }
    }).catchError((error) {
      print(error.toString());
      emit(FilterError());
    });
  }

  //Filter Settings

  int selectedCategoryId = 0;
  int selectedCategoryIndex = 0;
  void changeCatergory(int index, int cateId) {
    emit(ChangeCatergoryLoading());
    selectedCategoryId = cateId;
    selectedCategoryIndex = index;
    emit(ChangeCatergoryChanged());
  }

  late double minRange;
  late double maxRange;
  late RangeValues selectedRange;
  void changeRange(RangeValues values) {
    emit(ChangeRangeValuesLoading());
    selectedRange = values;
    emit(ChangeRangeValuesChanged());
  }
}
