import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:book_store_app/core/database/remoteDatabase/endpoints.dart';
import 'package:book_store_app/features/home/model/productModel.dart';
import 'package:meta/meta.dart';

import '../../../core/database/remoteDatabase/DioHelper.dart';
import '../model/get_all_categoriesModel.dart';
import '../model/sliderModel.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);

  SliderModel? sliderModel;
  List<String?> images = [];

  void getSlider() {
    emit(GetSliderLoadingState());
    DioHelper.getData(url: sliderUrl).then((value) {
      sliderModel = SliderModel.fromJson(value.data);
      for (var element in value.data['data']['sliders']) {
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
  List<Products> bestSeller = [];
  void getBestSeller() {
    emit(GetBestSellerLoadingState());
    DioHelper.getData(url: bestSellerUrl).then((value) {
      productModel = ProductModel.fromJson(value.data);
      for (var element in value.data['data']['products']) {
        bestSeller.add(Products.fromJson(element));
      }
      //print(value.data);
      emit(GetBestSellerSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetBestSellerErrorState());
    });
  }

  List<Products> newArrivals = [];
  void getNewArrivals() {
    emit(GetNewArrivalsLoadingState());
    DioHelper.getData(url: newArrivalsUrl).then((value) {
      for (var element in value.data['data']['products']) {
        newArrivals.add(Products.fromJson(element));
      }
      //print(value.data);
      emit(GetNewArrivalsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetNewArrivalsErrorState());
    });
  }

  List<AllCategories> allCategories = [];
  void getAllCategories() {
    emit(GetAllCategoriesLoadingState());
    DioHelper.getData(url: getAllCategoriesUrl).then((value) {
      for (var element in value.data['data']['categories']) {
        allCategories.add(AllCategories.fromJson(element));
      }
      print(value.data);
      emit(GetAllCategoriesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetAllCategoriesErrorState());
    });
  }

  List<Products> favouriteItems = [];

  void getFavouriteItems() {
    emit(GetFavouriteItemsLoadingState());
    DioHelper.getData(url: getFavouriteItemsUrl).then((value) {
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

  bool checkFavourite(int id) {
    for (var products in favouriteItems) {
      if (products.id == id) {
        return true;
      }
    }
    return false;
  }

  addFavourite({required Products product}) {
    emit(AddFavouriteItemLoadingState());
    return DioHelper.PostData(url: addFavouriteUrl, data: {
      'product_id': product.id,
    }).then((value) {
      favouriteItems.add(product);
      emit(AddFavouriteItemSuccessfullyState());
    }).catchError((error) {
      print(error.toString());
      print(AddFavouriteItemErrorState());
    });
  }

  removeFavourite({required Products product}) {
    emit(RemoveFavouriteItemLoadingState());
    return DioHelper.PostData(url: removeFavouriteUrl, data: {
      'product_id': product.id,
    }).then((value) {
      favouriteItems.removeWhere((element) => element.id == product.id);
      emit(RemoveFavouriteItemSuccessfullyState());
    }).catchError((error) {
      print(error.toString());
      print(RemoveFavouriteItemErrorState());
    });
  }

  handleFavourite({required Products product}) {
    if (checkFavourite(product.id!)) {
      removeFavourite(product: product);
    } else {
      addFavourite(product: product);
    }
  }
  @override
  Future<void> close() {
    // TODO: implement close
    return super.close();
  }
}
