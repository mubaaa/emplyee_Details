part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class LoadUserDataEvent extends UserEvent {
  List<Object> get props => [];
}
