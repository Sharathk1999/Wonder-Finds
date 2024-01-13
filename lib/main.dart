import 'package:flutter/material.dart';
import 'package:wonder_finds/constants/global_variables.dart';

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
      home:  Scaffold(
        appBar: AppBar(
          title:const Text("Wonder Finds"),
        ),
        body:Column(
          children: [
            const Center(
              child: Text("Welcome home your search matters..."),
            ),
            ElevatedButton(onPressed: (){}, child: const Text("Explore",),),
          ],
        ),
      ),
    );
  }
}
