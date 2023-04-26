part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable {}

class AuthInitial extends AuthState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AuthLoading extends AuthState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AuthSuccessful extends AuthState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AuthError extends AuthState {
  String? msgError;
  AuthError(this.msgError);
  @override
  // TODO: implement props
  List<Object?> get props => [msgError];
}
