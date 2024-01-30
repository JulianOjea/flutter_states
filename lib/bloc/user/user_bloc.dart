import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_states/models/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserInitialState()) {
    on<ActivateUser>((event, emit) => emit(UserSetState(event.user)));

    on<DeleteUser>((event, emit) => emit(const UserInitialState()));

    on<ChangeUserAge>((event, emit) {
      if (!state.existsUser) return;
      //Esto no se debe hacer porque se está mutando el estado
      //state.user!.age = event.age; //
      emit(UserSetState(state.user!.copyWith(age: event.age)));
    });

    on<AddProfession>((event, emit) {
      if (!state.existsUser) return;
      //List<String> professions = List.from(state.user!.professions);
      //professions.add(event.profession);
      //otra manera de hacer esto:
      List<String> professions = [...state.user!.professions, event.profession];
      emit(UserSetState(state.user!.copyWith(professions: professions)));
    });
  }
}
