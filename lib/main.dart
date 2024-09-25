import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:donrua_app/config/config.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    const mainColor = Color(0xff0d1946);
    const primaryColor = Color(0xffff65c2);
    const secondaryColor = Color(0xffec9824);
    const cardColor = Color(0xFFEEEEEE);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme().copyWith(
            colorScheme: ColorScheme(
                brightness: Brightness.light,
                primary: mainColor,
                onPrimary: Colors.white,
                secondary: primaryColor,
                onSecondary: Colors.white,
                tertiary: secondaryColor,
                onTertiary: Colors.white,
                error: Colors.red[900]!,
                onError: Colors.red[200]!,
                surface: cardColor,
                onSurface: mainColor),
          ),
      routerConfig: appRouter,
    );
  }
}
