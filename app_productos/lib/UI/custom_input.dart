import 'package:flutter/material.dart';

class CustomInput {

  static InputDecoration customInputDecoration({
    String? hintText, String? labelText, String? helperText,
    IconData? prefixIcon
  }){
    return InputDecoration(
        enabledBorder: const UnderlineInputBorder(
            //Cuando esta habilitado
            borderSide: BorderSide(
          color: Colors.purple,
        )),
        focusedBorder: const UnderlineInputBorder(
            //Cuando esta habilitado y en el foco
            borderSide: BorderSide(
          color: Colors.purple,
        )),
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: Colors.deepPurple)
            : null,
        hintText: hintText,
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.grey),
        helperText: helperText,
        
      );
  } 
}
