import 'package:flutter/material.dart';
import 'package:gerenciamento_estado/pages/login_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Text("Login"),
          centerTitle: true,
        ),
        body: const LoginPage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
