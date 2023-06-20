import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final bool oscuredText;
  final Function(String)? onChaged;
  final String? Function(String?)? validator;
  const CustomTextFormField(
      {super.key,
      this.label,
      this.hint,
      this.errorMessage,
      this.onChaged,
      this.validator,
      this.oscuredText = false});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
    );

    return TextFormField(
      onChanged: onChaged,
      validator: validator,
      obscureText: oscuredText,
      decoration: InputDecoration(
          enabledBorder: border,
          focusedBorder: border.copyWith(
            borderSide: BorderSide(
              color: colors.primary,
            ),
          ),
          errorBorder: border.copyWith(
            borderSide: BorderSide(
              color: Colors.red.shade800,
            ),
          ),
          focusedErrorBorder: border.copyWith(
            borderSide: BorderSide(
              color: Colors.red.shade800,
            ),
          ),
          isDense: true,
          label: label != null ? Text(label!) : null,
          hintText: hint,
          focusColor: colors.primary,
          errorText: errorMessage
          // prefix: Icon(
          //   Icons.supervised_user_circle_outlined,
          //   color: colors.primary,
          // ),
          ),
    );
  }
}
