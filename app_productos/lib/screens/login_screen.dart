import 'package:app_productos/providers/login_form_provider.dart';
import 'package:app_productos/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AuthBackgroundScreen(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 200,
                  ),
                  CardContainer(
                    child: Column(children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Login',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ChangeNotifierProvider(
                          create: (_) => LoginFormProvider(), child: _LoginForm()),
                      MaterialButton(onPressed: () {})
                    ]),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    'Crear una nueva cuenta',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            )
          )
        );
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Form(
        key: loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              initialValue: '',
              autofocus: false,
              keyboardType: TextInputType.emailAddress,
              decoration: CustomInput.customInputDecoration(
                hintText: 'ejemplo@email.com',
                labelText: 'Correo Electronico',
                prefixIcon: Icons.alternate_email_sharp,
              ),
              onChanged: (value) => loginForm.email = value,
              validator: (value) {
                String pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp = RegExp(pattern);

                return regExp.hasMatch(value ?? '')
                    ? null
                    : 'El valor ingresado no es un correo, ingresa uno valido';
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              obscureText: true,
              autocorrect: false,
              initialValue: '',
              autofocus: false,
              keyboardType: TextInputType.emailAddress,
              decoration: CustomInput.customInputDecoration(
                hintText: '',
                labelText: 'Contraseña',
                prefixIcon: Icons.lock,
              ),
              onChanged: (value) => loginForm.password = value,
              validator: (value) {
                return (value != null && value.length >= 6)
                    ? null
                    : 'Ingresa una contraseña valida';
              },
            ),
            const SizedBox(
              height: 30,
            ),
            MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                disabledColor: Colors.grey,
                color: Colors.deepPurple,
                onPressed: loginForm.isLoading
                    ? null
                    : () async {
                        FocusScope.of(context).unfocus();
                        if (!loginForm.isValidForm()) return;

                        loginForm.isLoading = true;

                        await Future.delayed(const Duration(seconds: 2));

                        loginForm.isLoading = false;

                        Navigator.pushReplacementNamed(context, 'home');
                      },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  child: Text(
                    loginForm.isLoading ? 'Espere' : 'Ingresar',
                    style: const TextStyle(color: Colors.white),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
