import 'package:equatable/equatable.dart';
import '../../data/models/auth_response_model.dart';

abstract class LoginState extends Equatable {
  const LoginState();
  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final AuthResponseModel authResponse;
  const LoginSuccess(this.authResponse);
  @override
  List<Object?> get props => [authResponse];
}

class LoginFailure extends LoginState {
  final String message;
  final int? statusCode;
  const LoginFailure(this.message, {this.statusCode});
  @override
  List<Object?> get props => [message, statusCode];
}