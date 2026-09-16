import 'package:equatable/equatable.dart';

abstract class ResendVerificationState extends Equatable {
  const ResendVerificationState();
  @override
  List<Object?> get props => [];
}

class ResendVerificationInitial extends ResendVerificationState {}
class ResendVerificationLoading extends ResendVerificationState {}
class ResendVerificationSuccess extends ResendVerificationState {}

class ResendVerificationFailure extends ResendVerificationState {
  final String message;
  const ResendVerificationFailure(this.message);
  @override
  List<Object?> get props => [message];
}