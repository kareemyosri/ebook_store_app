// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_cubit.dart';

enum ProfileStatus { initial, loading, loaded, updated, error }

enum LogOutStatus { initial, loading, success, error }

class ProfileState extends Equatable {
  final ProfileStatus profileStatus;
  final ProfileModel user;
  final LogOutStatus logOutStatus;

  const ProfileState({
    this.profileStatus = ProfileStatus.initial,
    this.user = ProfileModel.empty,
    this.logOutStatus = LogOutStatus.initial,
  });
  @override
  List<Object?> get props => [user, profileStatus, logOutStatus];

  ProfileState copyWith({
    ProfileStatus? profileStatus,
    ProfileModel? user,
    LogOutStatus? logOutStatus,
  }) {
    return ProfileState(
      profileStatus: profileStatus ?? this.profileStatus,
      user: user ?? this.user,
      logOutStatus: logOutStatus ?? this.logOutStatus,
    );
  }
}
