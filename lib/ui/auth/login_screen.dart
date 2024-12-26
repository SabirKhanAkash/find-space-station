import 'package:find_space_station/viewmodels/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:find_space_station/ui/auth/widgets/build_login_body.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final AuthViewModel authViewModel = Provider.of<AuthViewModel>(context, listen: false);

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 2000), () {
      authViewModel.login(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildLoginBody(),
    );
  }
}
