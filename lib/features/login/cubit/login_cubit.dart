import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/database/remoteDatabase/DioHelper.dart';
import '../../../core/database/remoteDatabase/endpoints.dart';
import '../model/loginModel.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool isChecked = false;

  changeCheckBox(checked) {
    isChecked = checked;
    emit(ChangeRememberState());
  }

  LoginModel? loginModel;

  void login({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    DioHelper.PostData(url: loginUrl, data: {
      'email': email,
      "password": password,
    }).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      //print(loginModel?.data?.token);
      //print(loginModel?.data?.id);
      //print(value.data);
      emit(LoginSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorState());
    });
  }

  bool isPassword = true;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    emit(ChangePasswordVisibilityState());
  }

  final List<String> errors = [];

  void adderror({required String error}) {
    if (!errors.contains(error)) errors.add(error);
  }

  void removeerror({required String error}) {
    if (errors.contains(error)) errors.remove(error);
  }
}
