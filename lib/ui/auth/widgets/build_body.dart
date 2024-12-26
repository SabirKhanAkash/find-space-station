import 'package:flutter/material.dart';
import 'package:flutter_mvvm_starter/data/dto/auth_dto.dart';
import 'package:flutter_mvvm_starter/viewmodels/auth_view_model.dart';
import 'package:provider/provider.dart';

Widget buildBody(
    TextEditingController userNameController, TextEditingController passwordController) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: TextFormField(
              controller: userNameController,
              textAlign: TextAlign.start,
              maxLines: 1,
              maxLength: 20,
              keyboardType: TextInputType.name),
        ),
        const SizedBox(height: 20),
        Consumer<AuthViewModel>(builder: (context, authViewModel, _) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextFormField(
              controller: passwordController,
              textAlign: TextAlign.start,
              maxLines: 1,
              maxLength: 20,
              keyboardType: TextInputType.name,
              obscureText: authViewModel.isObscure,
            ),
          );
        }),
        const SizedBox(height: 20),
        Consumer<AuthViewModel>(builder: (context, authViewModel, _) {
          return authViewModel.isLoading
              ? const CircularProgressIndicator.adaptive()
              : Consumer<AuthViewModel>(builder: (context, authState, _) {
                  return ElevatedButton(
                    onLongPress: () => authState.toggleObscureness(),
                    onPressed: () async => await authViewModel.login(
                        context,
                        AuthDto(
                            username: userNameController.text, password: passwordController.text)),
                    child: const Text(
                      "Login",
                      style: TextStyle(fontFamily: 'inter'),
                    ),
                  );
                });
        })
      ],
    ),
  );
}
