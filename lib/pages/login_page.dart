import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Column(
        children: [emailField(), senhaField(), botaoEnvia()],
      ),
    );
  }

  Widget emailField() {
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: 'Insira seu e-mail',
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            filled: true),
      ),
    );
  }

  Widget senhaField() {
    return Container(
      margin: const EdgeInsets.all(50.0),
      child: TextField(
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        decoration: InputDecoration(
            hintText: 'Senha',
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            filled: true),
      ),
    );
  }

  Widget botaoEnvia() {
    return ElevatedButton(
        onPressed: () {
          print('logou ou não...');
        },
        child: const Text('Enviar'));
  }
}
