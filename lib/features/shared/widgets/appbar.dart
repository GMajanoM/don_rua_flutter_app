import 'package:flutter/material.dart';

AppBar getAppbar(Size size) {
  return AppBar(
    title: SizedBox(
      height: size.height * 0.05,
      child: Image.asset('assets/img/logo-white.png'),
    ),
  );
}
