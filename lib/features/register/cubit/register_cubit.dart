import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/database/remoteDatabase/DioHelper.dart';
import '../../../core/database/remoteDatabase/endpoints.dart';
import '../model/registerModel.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context)=>BlocProvider.of(context);


  RegisterModel? registerModel;
  void register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) {
    emit(RegisterLoadingState());
    DioHelper.PostData(url: registerUrl, data: {
      'name' : name,
      'email': email,
      'password': password,
      'password_confirmation' : passwordConfirmation,
    }).then((value) {
      registerModel = RegisterModel.fromJson(value.data);

      print(value.data);
      emit(RegisterSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(RegisterErrorState());
    });
  }

  bool isPassword=true;
  void changePasswordVisibility(){
    isPassword =!  isPassword;
    emit(ChangePasswordVisibilityState());

  }




}
