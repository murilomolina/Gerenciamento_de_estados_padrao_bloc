import 'package:flutter/material.dart';
import '../blocs/bloc.dart';

class LoginPage extends StatelessWidget{
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Column(
        children: [emailField(), passwordField(), loginButton()],
      ),
    );
  }

  Widget emailField() {
    return StreamBuilder(
        stream: bloc.email,
        builder: (contex, AsyncSnapshot <String> snapshot) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 20.0),
            child: TextField(
              onChanged: (valorDigitado){
                bloc.changeEmail(valorDigitado);
              },
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: 'seu@email.com',
                  labelText: 'Insira seu e-mail',
                  errorText: snapshot.hasError? snapshot.error.toString(): null, // snapshot.error?.toString() /// esse "?." é um acesso condicional, só 'acessará' o .toString() se o sanpshot.error for vervadeiro.
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  filled: true),
            ),
          );
        });
  }

  Widget passwordField() {

    return StreamBuilder(
      stream: bloc.password,
      builder: (context, AsyncSnapshot <String> snapshot){
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 20.0),
          child: TextField(
            onChanged: (valorDigitado) {
              bloc.changePassword(valorDigitado);
            },
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            decoration: InputDecoration(
                hintText: 'Senha',
                labelText: 'Digite sua senha',
                errorText: snapshot.hasError? snapshot.error.toString(): null,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                filled: true),
          ),
        );
      }
    );
  }

  Widget loginButton() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
              onPressed: () {
                print('logou ou não...');
              },
              child: const Text('Login')),
        ),
      ],
    );
  }
}
