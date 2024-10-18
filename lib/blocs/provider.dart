import 'package:flutter/material.dart';

class Provider extends InheritedWidget{
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
    
  }
  Provider({Key? key, required Widget child}) : super(key: key, child: child);

}