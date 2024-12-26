import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget buildHomeBody() {
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Lottie.asset('assets/icons/ic_lottie_satelite_home.json')],
    ),
  );
}
