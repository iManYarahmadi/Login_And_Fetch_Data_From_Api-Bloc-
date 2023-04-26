import 'package:equatable/equatable.dart';
import 'package:fetchdatafromapi/features/fetch_data/model/usermodel.dart';

abstract class UserState extends Equatable {}

class UserLoadingState extends UserState {
  @override
  List<Object?> get props => [];
}

class UserLoadedState extends UserState {
  final List<UserModel> users;
  UserLoadedState(this.users);
  @override
  List<Object?> get props => [];
}


class UserErrorState extends UserState {
  final String error;
  UserErrorState(this.error);
  @override
  List<Object?> get props => [];
}