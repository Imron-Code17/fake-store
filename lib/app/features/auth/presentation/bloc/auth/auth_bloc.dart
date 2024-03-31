import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fakestore/app/core/components/snackbar/app_snackbar.dart';
import 'package:fakestore/app/core/constant/constant.dart';
import 'package:fakestore/app/core/utils/app_storage/app_storage.dart';
import 'package:fakestore/app/core/utils/extension/context.dart';
import 'package:fakestore/app/features/auth/domain/usecase/todo_login.dart';
import 'package:fakestore/app/features/auth/presentation/utils/models/login_body.dart';
import 'package:fakestore/app/routes/pages.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final TodoLoginUseCase _todoLoginUseCase;
  AuthBloc(this._todoLoginUseCase) : super(AuthState.init()) {
    on<TodoLoginEvent>(onLogin);
  }

  void onLogin(TodoLoginEvent event, Emitter<AuthState> emit) async {
    var body = LoginBody(
      username: event.username,
      password: event.password,
    );
    emit(state.copyWith(status: AuthStatus.loading));
    final result = await _todoLoginUseCase.call(body);
    result.fold((error) {
      emit(state.copyWith(status: AuthStatus.failure));
      AppSnackbar.show(message: error.message, type: SnackType.error);
    }, (data) {
      AppStorage().saveAuthToken(data: data);
      emit(state.copyWith(status: AuthStatus.success));
      navigatorKey.currentContext!.to(Pages.product);
    });
  }
}
