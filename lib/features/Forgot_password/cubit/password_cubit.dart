import 'package:bloc/bloc.dart';
import 'package:book_store_app/core/database/remoteDatabase/DioHelper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/database/remoteDatabase/endpoints.dart';

part 'password_state.dart';

class PasswordCubit extends Cubit<PasswordState> {
  PasswordCubit() : super(PasswordInitial());
  static PasswordCubit get(context)=>BlocProvider.of(context);
  bool obscure= true;

  void changeIcon() {
    obscure =! obscure;
    print(obscure);
    emit(ChangeIconState());
  }
  
  
  requestResetCode(String email){
    emit(RequestCodeLoading());
    DioHelper.PostData(url: requestResetCodeUrl, data: {
      'email':email
    })
        .then((value) {
          emit(RequestCodeSuccess());
    }).catchError((error){
      emit(RequestCodeError());

    });
  }


  String requestCode="";
  void getRequestCode(String pin) {
    requestCode =pin;
    print(requestCode);
    emit(RequestCodeChange());
  }

  verifyCode(){
    emit(VerifyCodeLoading());
    DioHelper.PostData(url: verifyCodeUrl, data: {
      'verify_code':requestCode
    })
        .then((value) {
      emit(VerifyCodeSuccess());
    }).catchError((error){
      print(error.toString());
      emit(VerifyCodeError());

    });
  }

  createPassword(
      String password,
      String confirmPassword
      ){
    emit(ResetLoading());
    DioHelper.PostData(url: resetPasswordUrl, data: {
      'verify_code':requestCode,
      'new_password':password,
      'new_password_confirmation':confirmPassword
    })
        .then((value) {
      emit(ResetSuccess());
    }).catchError((error){
      print(error.toString());
      emit(ResetError());

    });

  }

  
  
}
