import 'package:flutter/material.dart';

PreferredSizeWidget buildAppBar(BuildContext context, String title) {
  return AppBar(
    centerTitle: true,
    toolbarHeight: 70,
    backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    title: Text(
      title,
      style: const TextStyle(fontFamily: 'inter'),
    ),
  );
}
