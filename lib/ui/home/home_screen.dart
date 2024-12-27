import 'package:find_space_station/ui/home/widgets/build_app_bar.dart';
import 'package:find_space_station/ui/home/widgets/build_home_body.dart';
import 'package:find_space_station/viewmodels/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeViewModel homeViewModel = Provider.of<HomeViewModel>(context, listen: false);

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await homeViewModel.getIssCurrentLocation();
      homeViewModel.startCountDownTimer();
    });

    super.initState();
  }

  @override
  void dispose() {
    homeViewModel.timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "Find Int'l Space Station"),
      body: buildHomeBody(context),
    );
  }
}
