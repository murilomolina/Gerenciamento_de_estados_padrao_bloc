import 'dart:async';
import 'package:email_validator/email_validator.dart';

mixin Validators{
    final validateEmail = StreamTransformer<String, String>.fromHandlers(
        handleData: (email, sink){
            // se o e-mail for válido (validar com o e-mail validator)
            // adicionar ele ao sink
            // caso contrário, adicionar uma mensagem de erro ao sink: E-mail inválido
            if (EmailValidator.validate(email)) {
              sink.add(email);
            }else{
                sink.addError('E-mail inválido');
            }
        }
    );

    final validatePassword = StreamTransformer<String, String>.fromHandlers(
        handleData: (password, sink){
            if (password.length >= 4) {
              sink.add(password);
            }
            else{
                sink.addError('A senha deve ter pelo menos 4 caracteres');
            }
        }
    );

}