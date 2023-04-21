import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class InputsScreen extends StatelessWidget {
  const InputsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

    final Map<String, String> formValues = {
      'first_name': '',
      'last_name': '',
      'email': '',
      'password': '',
      'role': ''
    };

    return Scaffold(
        appBar: AppBar(
          title: const Text('Inputs Screen'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Form(
              key: myFormKey,
              child: Column(
                children: [
                  CustomInputField(
                    formPropety: 'first_name',
                    formValues: formValues,
                    labelText: 'Nombre',
                    hintText: 'Nombre del usuario',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomInputField(
                    formPropety: 'last_name',
                    formValues: formValues,
                    labelText: 'Apellido',
                    hintText: 'Apellido del usuario',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomInputField(
                    formPropety: 'email',
                    formValues: formValues,
                    keyboardType: TextInputType.emailAddress,
                    labelText: 'Correo',
                    hintText: 'const Correo del usuario',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomInputField(
                    formPropety: 'password',
                    formValues: formValues,
                    obscureText: true,
                    labelText: 'Contraseña',
                    hintText: 'Contraseña del usuario',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  DropdownButtonFormField(
                      value: 'Admin',
                      items: const [
                        DropdownMenuItem(value: 'Admin', child: Text('Admin')),
                        DropdownMenuItem(value: 'SuperUser', child: Text('SuperUser')),
                        DropdownMenuItem(value: 'LowAdmin', child: Text('LowAdmin')),
                        DropdownMenuItem(value: 'User', child: Text('User')),

                      ],
                      onChanged: (value) {
                       
                        formValues['role'] = value ?? 'Admin';
                      }),
                  ElevatedButton(
                      onPressed: () {
                        FocusManager.instance.primaryFocus?.unfocus();

                        if (!myFormKey.currentState!.validate()) {
                          

                          return;
                        }
                        
                      },
                      child: const SizedBox(
                          width: double.infinity,
                          child: Center(child: Text('Guardar')))),
                ],
              ),
            ),
          ),
        ));
  }
}
