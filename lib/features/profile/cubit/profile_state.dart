// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_cubit.dart';

enum ProfileStatus { initial, loading, loaded, updated, error }

class ProfileState extends Equatable {
  final ProfileStatus profileStatus;
  final ProfileModel user;

  const ProfileState({
    this.profileStatus = ProfileStatus.initial,
    this.user = ProfileModel.empty,
  });
  @override
  List<Object?> get props => [
        user,
        profileStatus,
      ];

  ProfileState copyWith({
    ProfileStatus? profileStatus,
    ProfileModel? user,
  }) {
    return ProfileState(
      profileStatus: profileStatus ?? this.profileStatus,
      user: user ?? this.user,
    );
  }
}
