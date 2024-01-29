part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {
  final existsUser = false;

  // @override
  // String toString() {
  //   return 'UserInitial: no existe usuario, esta en $existsUser';
  // }
}

class UserActive extends UserState {
  final existsUser = true;
  final User user;

  UserActive(this.user);
}
