
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/database/remoteDatabase/DioHelper.dart';
import '../../../core/database/remoteDatabase/endpoints.dart';

part 'changepassword_state.dart';

class ChangepasswordCubit extends Cubit<ChangepasswordState> {
  ChangepasswordCubit() : super(ChangepasswordInitial());

  static ChangepasswordCubit get(context)=>BlocProvider.of(context);

  void updateUserPassword({
    required String currentPassword,
    required String newPassword,
    required String newPasswordConfirmation,
  }) {
    emit(ChangePasswordLoadingState());
      DioHelper.PostData(url: updatePasswordUrl, data: {
        "current_password": currentPassword,
        "new_password": newPassword,
        "new_password_confirmation": newPasswordConfirmation,
      }).then((value) {
        print(value.data);
        emit(ChangePasswordSuccessfullyState());
      }).catchError((error){
        print(error.toString());
        emit(ChangePasswordErrorState());
      });

  }

}
