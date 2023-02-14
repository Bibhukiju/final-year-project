import 'package:election/screens/area_selection_screen.dart';
import 'package:election/screens/homescreen.dart';
import 'package:election/screens/voting_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mero Vote',
      theme: ThemeData(
        textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
          padding: const MaterialStatePropertyAll(
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0)),
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          backgroundColor: const MaterialStatePropertyAll(Color(0XFF082585)),
        )),
      ),
      home: const HomeScreen(),
      routes: {
        AreaSelectionScreen.routeName: (ctx) => const AreaSelectionScreen(),
        VotingScreen.routeName: (ctx) => const VotingScreen(),
      },
    );
  }
}
