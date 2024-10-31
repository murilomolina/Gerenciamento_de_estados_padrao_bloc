import 'package:flutter/material.dart';
import 'bloc.dart';

class Provider extends InheritedWidget{

  final bloc = Bloc();

  static Bloc? of (BuildContext context){
    // return context.dependOnInheritedWidgetOfExactType<Provider>()!.bloc; // para precaver de receber um nullPointerException (avisando para o dartvm que voce garante que o que está a esquerda do '!' não é null, deixando o programa a exposta a tomar um null do compilador) seria ideal implementar um try catch.
    return context.dependOnInheritedWidgetOfExactType<Provider>()?.bloc;
  }
  
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
    
  }
  Provider({Key? key, required Widget child}) : super(key: key, child: child); 


}