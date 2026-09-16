import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/error/exceptions.dart';
import '../../data/repository/auth_repository.dart';
import 'resend_verification_state.dart';

class ResendVerificationCubit extends Cubit<ResendVerificationState> {
  final AuthRepository _authRepository;

  ResendVerificationCubit(this._authRepository) : super(ResendVerificationInitial());

  Future<void> resend({required String email}) async {
    emit(ResendVerificationLoading());
    try {
      await _authRepository.resendVerification(email: email);
      emit(ResendVerificationSuccess());
    } on ServerException catch (e) {
      emit(ResendVerificationFailure(e.message));
    } on NetworkException catch (e) {
      emit(ResendVerificationFailure(e.message));
    } catch (_) {
      emit(ResendVerificationFailure('Something went wrong'));
    }
  }
}