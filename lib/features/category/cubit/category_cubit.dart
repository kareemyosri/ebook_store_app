import 'package:book_store_app/core/database/remoteDatabase/DioHelper.dart';
import 'package:book_store_app/core/database/remoteDatabase/endpoints.dart';
import 'package:book_store_app/features/category/model/category.dart';
import 'package:book_store_app/features/home/model/productModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());
  static CategoryCubit get(context) => BlocProvider.of(context);

  List<Products> categoryItems = [];

  void getAllCategory({required String id}) {
    emit(CategoryLoading());
    DioHelper.getData(url: '$getAllCategoriesUrl/$id').then((value) {
      print(value.data);

      for (var element in value.data['data']['products']) {
        categoryItems.add(Products.fromJson(element));
      }
      emit(CategoryLoaded());
    }).catchError((error) {
      print(error.toString());
      emit(CategoryError());
    });
  }
}
