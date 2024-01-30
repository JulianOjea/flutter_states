part of 'user_bloc.dart';

@immutable
abstract class UserState {
  final bool existsUser;
  final User? user;

  const UserState({this.existsUser = false, this.user});
}

class UserInitialState extends UserState {
  const UserInitialState() : super(existsUser: false, user: null);
}

class UserSetState extends UserState {
  final User newUser;

  const UserSetState(this.newUser) : super(existsUser: true, user: newUser);
}
