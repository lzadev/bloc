import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../infraestructure/inputs/inputs.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(const RegisterFormState());

  void onSubmit() {
    emit(
      state.copyWith(
        formStatus: FormStatus.validating,
        username: UserName.dirty(state.username.value),
        email: Email.dirty(state.email.value),
        password: Password.dirty(state.password.value),
        isValid: Formz.validate([state.username, state.password, state.email]),
      ),
    );

    if (!state.isValid) {
      print('Invalid form');
      return;
    }

    print('$state');
  }

  void usernameChanged(String value) {
    final username = UserName.dirty(value);
    emit(
      state.copyWith(
        username: username,
        isValid: Formz.validate([username, state.password]),
      ),
    );
  }

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([email, state.username, state.password]),
      ),
    );
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([password, state.username]),
      ),
    );
  }
}
