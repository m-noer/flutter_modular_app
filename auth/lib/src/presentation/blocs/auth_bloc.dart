import 'package:auth/src/data/models/models.dart';
import 'package:auth/src/domain/usecases/usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
    this.loginUsecase,
  ) : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());

      final failureOrLogin = await loginUsecase.call(event.body);
      failureOrLogin.fold(
        (l) => emit(AuthFailure(message: l.message)),
        (r) {
          return emit(AuthSuccess());
        },
      );
    });
  }

  final LoginUsecase loginUsecase;
}
