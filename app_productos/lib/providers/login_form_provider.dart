import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners(); // Notifica el cambio en LoginFormProvider a todos los widgets que esten escuchando
  }

  bool isValidForm() {
    print('${email} - ${password}');
    return formKey.currentState?.validate() ?? false;
  }
}
