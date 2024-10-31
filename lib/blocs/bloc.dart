import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rxdart/rxdart.dart';
import 'package:gerenciamento_estado/validators/validators.dart';
class Bloc with Validators{ 
  final _emailController = BehaviorSubject <String> ();
  final _passwordController = BehaviorSubject <String> ();

  Stream<String> get email => _emailController.stream.transform(validateEmail);

  Stream<String> get password => _passwordController.stream.transform(validatePassword);
  
  // Stream responsavel por exibir o botão de login
  Stream<bool> get emailAndPassowrdAreOk => CombineLatestStream.combine2(email, password, (e, p) => true);

  Function(String) get changeEmail => _emailController.sink.add;

  Function(String) get changePassword => _passwordController.sink.add;

  void submitForm(){
    final email = _emailController.value;
    final senha = _passwordController.value;
    Fluttertoast.showToast(msg: 'E-mail: $email' + '\n' + 'Senha: $senha');
  }

  void dispose(){
    _emailController.close();
    _passwordController.close();
  }
}
// descartar a instancia global pois cada provider tera a sua instancia (não global) para a suas classes
// final bloc = Bloc(); // instancia global