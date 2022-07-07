part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoadedState extends UserState {
  final List<UserModel?> usermodels;

  const UserLoadedState(this.usermodels);
  @override
  List<Object> get props => [usermodels];
}

class UserLoadingState extends UserState {
  @override
  List<Object> get props => [];
}
