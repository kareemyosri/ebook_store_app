import 'package:book_store_app/features/all_books/view/screen/all_books_screen.dart';
import 'package:book_store_app/features/cart/view/screens/cart_screen.dart';
import 'package:book_store_app/features/category/view/screens/category_screen.dart';
import 'package:book_store_app/features/changePassword/view/change_password_screen.dart';
import 'package:book_store_app/features/favourites/view/screens/favourite_screen.dart';
import 'package:book_store_app/features/home/model/get_all_categoriesModel.dart';
import 'package:book_store_app/features/home/model/productModel.dart';
import 'package:book_store_app/features/home/view/screens/home_screen.dart';
import 'package:book_store_app/features/home_details/view/screen/details_screen.dart';
import 'package:book_store_app/features/login/view/screen/login_screen.dart';
import 'package:book_store_app/features/onboarding/view/screen/onboarding_screen.dart';
import 'package:book_store_app/features/order_history/view/screens/order_history_screen.dart';
import 'package:book_store_app/features/order_history_details/view/screens/order_history_details_screen.dart';
import 'package:book_store_app/features/place_order/view/screens/order_screen.dart';
import 'package:book_store_app/features/search/view/search_screen.dart';
import 'package:book_store_app/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import '../../features/Forgot_password/view/screens/checkmail_password_screen.dart';
import '../../features/Forgot_password/view/screens/create_new_password.dart';
import '../../features/Forgot_password/view/screens/forgotpassword_screen.dart';
import '../../features/Forgot_password/view/screens/success_ForgotPassword_screen.dart';
import '../../features/profile/view/screens/my_account_screen.dart';
import '../../features/profile/view/screens/profile_screen.dart';
import '../../features/register/view/screen/register_screen.dart';
import 'app_route.dart';

Route? onGenerateRouter(RouteSettings settings) {
  switch (settings.name) {
    case AppRoute.splashScreen:
      return MaterialPageRoute(builder: (_) => const SplashScreen());
    case AppRoute.onBoardingScreen:
      return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
    case AppRoute.loginScreen:
      return MaterialPageRoute(builder: (_) => const LoginScreen());
    case AppRoute.registerScreen:
      return MaterialPageRoute(builder: (_) => const RegisterScreen());
    case AppRoute.homeScreen:
      return MaterialPageRoute(builder: (_) => const HomeScreen());
    case AppRoute.productDetailsScreen:
      final args = settings.arguments as Products;
      return MaterialPageRoute(builder: (_) => DetailsScreen(products: args));
    case AppRoute.categoryScreen:
      final args = settings.arguments as AllCategories;
      return MaterialPageRoute(builder: (_) => CategoryScreen(category: args));

    case AppRoute.favouriteScreen:
      return MaterialPageRoute(builder: (_) => const FavouriteScreen());
    case AppRoute.allBooksScreen:
      return MaterialPageRoute(builder: (_) => const AllBooksScreen());
    case AppRoute.profileScreen:
      return MaterialPageRoute(builder: (_) => const ProfileScreen());
    case AppRoute.accountDetailsScreen:
      return MaterialPageRoute(builder: (_) => const MyAccountScreenBody());
    case AppRoute.changePasswordScreen:
      return MaterialPageRoute(builder: (_) => const ChangePasswordScreen());
    case AppRoute.cartScreen:
      return MaterialPageRoute(builder: (_) => const CartScreen());
    case AppRoute.orderScreen:
      return MaterialPageRoute(builder: (_) => const OrderScreen());
    case AppRoute.searchScreen:
      return MaterialPageRoute(builder: (_) => const SearchScreen());
    case AppRoute.orderHistoryScreen:
      return MaterialPageRoute(builder: (_) => const OrderHistoryScreen());
    case AppRoute.orderHistoryDetailsScreen:
      final args = settings.arguments as String;
      return MaterialPageRoute(builder: (_) => OrderHistoryDetailScreen(id: args));
    case AppRoute.forgotPasswordScreen:
      return MaterialPageRoute(builder: (_) =>  const ForgotPasswordScreen());
    case AppRoute.checkEmailForgetPasswordScreen:
      return MaterialPageRoute(builder: (_) =>  const CheckMailForgotPasswordScreen());
    case AppRoute.createNewPasswordScreen:
      return MaterialPageRoute(builder: (_) =>   const CreateNewPassword());
    case AppRoute.successForgotPasswordScreen:
      return MaterialPageRoute(builder: (_) =>  const SuccessForgotPasswordScreen());


    default:
      return null;
  }
}
