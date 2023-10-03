part of 'password_cubit.dart';

@immutable
abstract class PasswordState {}

class PasswordInitial extends PasswordState {}
class ChangeIconState extends PasswordState {}


class RequestCodeLoading extends PasswordState {}
class RequestCodeSuccess extends PasswordState {}
class RequestCodeError extends PasswordState {}

class VerifyCodeLoading extends PasswordState {}
class VerifyCodeSuccess extends PasswordState {}
class VerifyCodeError extends PasswordState {}

class RequestCodeChange extends PasswordState {}

class ResetLoading extends PasswordState {}
class ResetSuccess extends PasswordState {}
class ResetError extends PasswordState {}