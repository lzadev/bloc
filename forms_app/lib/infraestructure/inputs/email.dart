import 'package:formz/formz.dart';

// Define input validation errors
enum EmailnameError { empty, format }

// Extend FormzInput and provide the input type and error type.
class Email extends FormzInput<String, EmailnameError> {
  static final emailRegExp = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );
  // Call super.pure to represent an unmodified form input.
  const Email.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Email.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == EmailnameError.empty) return 'El campo es requerido';
    if (displayError == EmailnameError.format) return 'Email no valido';
    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  EmailnameError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return EmailnameError.empty;
    if (!emailRegExp.hasMatch(value)) return EmailnameError.format;

    return null;
  }
}
