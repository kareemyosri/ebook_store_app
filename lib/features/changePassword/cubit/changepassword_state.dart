part of 'changepassword_cubit.dart';

@immutable
abstract class ChangepasswordState {}

class ChangepasswordInitial extends ChangepasswordState {}
class ChangePasswordLoadingState extends ChangepasswordState {}
class ChangePasswordSuccessfullyState extends ChangepasswordState {}
class ChangePasswordErrorState extends ChangepasswordState {}
