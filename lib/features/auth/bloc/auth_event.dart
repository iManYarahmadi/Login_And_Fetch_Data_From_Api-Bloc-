part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent extends Equatable {}

class LoginEvent extends AuthEvent {
  String? email;
  String? password;

  LoginEvent({this.email, this.password});

  @override
  // TODO: implement props
  List<Object?> get props => [email, password];
}
