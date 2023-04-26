import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../repository/repo_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo _authRepo;
  AuthBloc(this._authRepo) : super(AuthLoading()) {
    on<LoginEvent>((event, emit) async {
      // TODO: implement event handler
      emit(AuthLoading());
      final result = await _authRepo.login(event.email, event.password);
      print(result.toString());
      if (result != "user not found" && result != "Missing password") {
        emit(AuthSuccessful());
      } else  {
        emit(AuthError("Missing password or user not found"));
      }
    });
  }
}
