import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_states/models/user.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  void selectUser(User user) {
    emit(UserActive(user));
  }

  void changeAge(int age) {
    final currentState = state;
    if (currentState is UserActive) {
      final newUser = (currentState as UserActive).user.copyWith(age: age);
      emit(UserActive(newUser));
    }
  }

  void addProffession() {
    final currentState = state;
    if (currentState is UserActive) {
      // List<String> proffessions = currentState.user.professions;
      // proffessions.add("Cochero");
      // Otra manera más guay de hacer eso:
      final professions = [
        ...currentState.user.professions,
        'Profesion ${currentState.user.professions.length + 1}'
      ];
      final newUser = currentState.user.copyWith(professions: professions);
      emit(UserActive(newUser));
    }
  }

  void deleteUser() {
    emit(UserInitial());
  }
}
