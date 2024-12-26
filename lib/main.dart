import 'package:find_space_station/core/services/api_service.dart';
import 'package:find_space_station/core/services/log_service.dart';
import 'package:find_space_station/data/repositories/remote/auth_repository.dart';
import 'package:find_space_station/ui/auth/login_screen.dart';
import 'package:find_space_station/utils/config/app_color.dart';
import 'package:find_space_station/utils/config/app_text.dart';
import 'package:find_space_station/viewmodels/auth_view_model.dart';
import 'package:find_space_station/viewmodels/home_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_splash_screen/flutter_splash_screen.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  Log.init();
  await initFirebase();
  runApp(const MyApp());
}

Future<void> initFirebase() async {
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (error) {
    Log.create(Level.error, error.toString());
  }
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
    Future.delayed(const Duration(milliseconds: 250), () {
      FlutterSplashScreen.hide();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthViewModel>(
          create: (context) => AuthViewModel(),
        ),
        ChangeNotifierProvider<HomeViewModel>(
          create: (context) =>
              HomeViewModel(homeRepository: HomeRepository(apiService: ApiService())),
        ),
      ],
      child: MaterialApp(
        title: AppText().title,
        theme: ThemeData(
          fontFamily: (AppText().mainFont),
          colorScheme: ColorScheme.fromSeed(seedColor: AppColor().primary),
          useMaterial3: true,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
