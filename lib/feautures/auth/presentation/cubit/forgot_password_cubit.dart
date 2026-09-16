import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/error/exceptions.dart';
import '../../data/repository/auth_repository.dart';
import 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final AuthRepository _authRepository;

  ForgotPasswordCubit(this._authRepository) : super(ForgotPasswordInitial());

  Future<void> sendResetLink({required String email}) async {
    emit(ForgotPasswordLoading());
    try {
      await _authRepository.forgotPassword(email: email);
      emit(ForgotPasswordSuccess());
    } on ServerException catch (e) {
      emit(ForgotPasswordFailure(e.message));
    } on NetworkException catch (e) {
      emit(ForgotPasswordFailure(e.message));
    } catch (_) {
      emit(ForgotPasswordFailure('Something went wrong'));
    }
  }
}