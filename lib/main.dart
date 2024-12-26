import 'package:flutter/material.dart';
import 'package:flutter_mvvm_starter/core/services/api_service.dart';
import 'package:flutter_mvvm_starter/core/services/log_service.dart';
import 'package:flutter_mvvm_starter/data/repositories/remote/auth_repository.dart';
import 'package:flutter_mvvm_starter/data/state/auth_state.dart';
import 'package:flutter_mvvm_starter/ui/auth/login_screen.dart';
import 'package:flutter_mvvm_starter/viewmodels/auth_view_model.dart';
import 'package:flutter_splash_screen/flutter_splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  Log.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    hideScreen();
  }

  Future<void> hideScreen() async {
    Future.delayed(const Duration(milliseconds: 500), () {
      FlutterSplashScreen.hide();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthViewModel>(
          create: (context) =>
              AuthViewModel(authRepository: AuthRepository(apiService: ApiService())),
        ),
        ChangeNotifierProvider<AuthState>(
          create: (context) => AuthState(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter MVVM Starter',
        theme: ThemeData(
          fontFamily: ('inter'),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const LoginScreen(title: 'Flutter MVVM Starter'),
      ),
    );
  }
}
