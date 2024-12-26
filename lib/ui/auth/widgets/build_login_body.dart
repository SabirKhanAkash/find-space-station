import 'package:find_space_station/utils/config/app_color.dart';
import 'package:find_space_station/utils/config/app_image.dart';
import 'package:find_space_station/viewmodels/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget buildLoginBody() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Consumer<AuthViewModel>(builder: (context, authState, _) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                AppImage().splashLogo,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 15),
              GestureDetector(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    authState.isLoading
                        ? const CircularProgressIndicator.adaptive()
                        : authState.anonymousLoginSuccess
                            ? Icon(
                                Icons.verified_rounded,
                                color: AppColor().primary,
                              )
                            : Icon(
                                Icons.error_rounded,
                                color: AppColor().primary,
                              ),
                    const SizedBox(width: 10),
                    authState.isLoading
                        ? const Text("Signing you anonymously...")
                        : authState.anonymousLoginSuccess
                            ? const Text("Anonymous Login Successful!")
                            : const Text("Tap here to try again")
                  ],
                ),
                onTap: () =>
                    authState.isLoading == false && authState.anonymousLoginSuccess == false
                        ? authState.login(context)
                        : (),
              ),
            ],
          );
        })
      ],
    ),
  );
}
