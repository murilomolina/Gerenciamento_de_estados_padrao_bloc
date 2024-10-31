import 'package:flutter/material.dart';
import 'package:gerenciamento_estado/blocs/bloc.dart';
import 'package:gerenciamento_estado/blocs/provider.dart';

class LoginPage extends StatelessWidget{
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Column(
        children: [emailField(bloc!), passwordField(bloc), loginButton(bloc)],
      ),
    );
  }

  Widget emailField(Bloc bloc) {
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

  Widget passwordField(Bloc bloc) {

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

  Widget loginButton(Bloc bloc) {
    return StreamBuilder(stream: bloc.emailAndPassowrdAreOk, 
      builder: (context, AsyncSnapshot <bool> snapshot){
        return ElevatedButton(onPressed: snapshot.hasData ? bloc.submitForm: null,
        child: Text('Logar'));
      }
    );
  }
}
