import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/error/exceptions.dart';
import '../../data/repository/auth_repository.dart';
import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepository _authRepository;

  RegisterCubit(this._authRepository) : super(RegisterInitial());

  Future<void> register({
    required String fullName,
    required String email,
    required String password,
  }) async {
    emit(RegisterLoading());
    try {
      await _authRepository.register(
        fullName: fullName,
        email: email,
        password: password,
      );
      emit(RegisterSuccess());
    } on ServerException catch (e) {
      emit(RegisterFailure(e.message));
    } on NetworkException catch (e) {
      emit(RegisterFailure(e.message));
    } catch (_) {
      emit(RegisterFailure('Something went wrong'));
    }
  }
}