import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  UserEvent();
}



class LoadUserEvent extends UserEvent{
  @override
  List<Object?> get props => [];

}