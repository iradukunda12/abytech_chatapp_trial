import 'package:chatapp/Widget/login/buildemailfield.dart';
import 'package:chatapp/Widget/login/buildloginbutton.dart';
import 'package:chatapp/Widget/login/buildpasswordfield.dart';
import 'package:chatapp/Widget/login/buildtitle.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildTitle(),
              const SizedBox(height: 40),
              buildEmailField(),
              const SizedBox(height: 20),
              buildPasswordField(),
              const SizedBox(height: 40),
              buildLoginButton(context),
            ],
          ),
        ),
      ),
    );
  }
}
