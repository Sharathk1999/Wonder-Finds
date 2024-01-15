import 'package:flutter/material.dart';
import 'package:wonder_finds/constants/global_variables.dart';
import 'package:wonder_finds/features/auth/screens/auth_screen.dart';
import 'package:wonder_finds/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wonder Finds',
      theme: ThemeData(
       scaffoldBackgroundColor: GlobalVariables.backgroundColor,
       colorScheme: const ColorScheme.light(
        primary: Colors.blueGrey,
       ),
       appBarTheme: const AppBarTheme(
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
       ),
       useMaterial3: true,

      ),
      onGenerateRoute: generateRoute,
      home: const AuthScreen()
    );
  }
}
