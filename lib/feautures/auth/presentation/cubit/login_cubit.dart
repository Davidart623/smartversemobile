import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/error/exceptions.dart';
import '../../data/repository/auth_repository.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginCubit(this._authRepository) : super(LoginInitial());

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      final authResponse =
      await _authRepository.login(email: email, password: password);
      emit(LoginSuccess(authResponse));
    } on ServerException catch (e) {
      emit(LoginFailure(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      emit(LoginFailure(e.message));
    } catch (_) {
      emit(LoginFailure('Something went wrong'));
    }
  }
}