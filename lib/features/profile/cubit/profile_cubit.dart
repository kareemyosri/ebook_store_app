import 'package:book_store_app/core/database/local_database/cache_helper.dart';
import 'package:book_store_app/core/database/local_database/secure_cache.dart';
import 'package:book_store_app/core/database/remoteDatabase/DioHelper.dart';
import 'package:book_store_app/core/database/remoteDatabase/endpoints.dart';
import 'package:book_store_app/core/enums.dart';
import 'package:book_store_app/features/home/cubit/home_cubit.dart';
import 'package:book_store_app/features/profile/model/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileState());
  static ProfileCubit get(context) => BlocProvider.of(context);

  void getUserData() async {
    emit(state.copyWith(profileStatus: ProfileStatus.loading));

    try {
      DioHelper.getData(url: profileUrl).then((value) {
        print(value.data);
        emit(state.copyWith(
            user: ProfileModel.fromMap(value.data['data']),
            profileStatus: ProfileStatus.loaded));
      });
    } catch (e) {
      emit(state.copyWith(profileStatus: ProfileStatus.error));
    }
  }

  void updateUserData({
    required String name,
    required String email,
    required String phone,
    required String address,
    required String city,
  }) async {
    emit(state.copyWith(profileStatus: ProfileStatus.loading));
    ProfileModel userUpdated = state.user.copyWith(
        name: name, email: email, phone: phone, address: address, city: city);
    try {
      DioHelper.PostData(url: updateProfileUrl, data: userUpdated.toMap())
          .then((value) {
        print(value.data);
        emit(state.copyWith(
            user: ProfileModel.fromMap(value.data['data']),
            profileStatus: ProfileStatus.updated));
      });
    } catch (e) {
      emit(state.copyWith(profileStatus: ProfileStatus.error));
    }
  }

  void logout() {
    emit(state.copyWith(logOutStatus: LogOutStatus.loading));
    DioHelper.PostData(url: logoutdUrl).then((value) async {
      await FlutterSecureStorageCache.delete(key: MySharedKeys.token);
      emit(state.copyWith(logOutStatus: LogOutStatus.success));
      close();
    }).catchError((error) {
      emit(state.copyWith(logOutStatus: LogOutStatus.error));
    });
  }

  @override
  Future<void> close() {
    return super.close();
  }


}
