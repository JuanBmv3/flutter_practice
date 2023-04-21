import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final TextInputType? keyboardType;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final IconData? suffixIcon;
  final IconData? icon;
  final bool obscureText;

  final String formPropety;
  final Map<String, String> formValues;

  const CustomInputField({
    super.key,
    this.hintText,
    this.labelText,
    this.helperText,
    this.suffixIcon,
    this.icon,
    this.keyboardType,
    this.obscureText = false,
    required this.formPropety,
    required this.formValues,
  });

  @override
  Widget build(BuildContext context) {
    final FocusNode focusNode = FocusNode();

    return GestureDetector(
      onTap: () {
        focusNode.unfocus();
      },
      child: TextFormField(
        onFieldSubmitted: (value) {
          focusNode.unfocus();
        },
        keyboardType: keyboardType,
        obscureText: obscureText,
        autofocus: false,
        initialValue: '',
        textCapitalization: TextCapitalization.words,
        onChanged: (value) {
          formValues[formPropety] = value;
        },
        validator: (value) {
          if (value == null) return 'Este campo es requerido';

          return value.length < 3 ? 'Minimo de 3 letras' : null;
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          helperText: helperText,
          // prefixIcon: Icon(Icons.abc),
          suffixIcon: suffixIcon == null ? null : Icon(suffixIcon),
          icon: icon == null ? null : Icon(icon),
        ),
      ),
    );
  }
}
