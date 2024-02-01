// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

sealed class LoginEvent {}

class LoginSaveEvent extends LoginEvent {
  final LoginModel request;
  LoginSaveEvent({
    required this.request,
  });
}
