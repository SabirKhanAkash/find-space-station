import 'package:flutter/material.dart';
import 'package:flutter_mvvm_starter/ui/auth/widgets/build_app_bar.dart';
import 'package:flutter_mvvm_starter/ui/auth/widgets/build_body.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.title});

  final String title;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, widget.title),
      body: buildBody(userNameController,
          passwordController), // This trailing comma makes auto-formatting nicer
      // for build methods.
    );
  }
}
