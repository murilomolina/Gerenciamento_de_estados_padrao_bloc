import 'package:flutter/material.dart';
import 'package:gerenciamento_estado/blocs/provider.dart';
import 'package:gerenciamento_estado/pages/login_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
        child: MaterialApp(
        title: "Login",
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey,
            title: const Text("Login"),
            centerTitle: true,
          ),
          body: const LoginPage(),
        ),
        debugShowCheckedModeBanner: false,
      )
    );
  }
}
