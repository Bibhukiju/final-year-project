import 'package:election/providers/candidate_provider.dart';
import 'package:election/screens/area_selection_screen.dart';
import 'package:election/screens/homescreen.dart';
import 'package:election/screens/voting_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CandidateProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
            padding: const MaterialStatePropertyAll(
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 48.0)),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
            backgroundColor: const MaterialStatePropertyAll(Color(0XFF082585)),
          )),
        ),
        home: HomeScreen(),
        routes: {
          AreaSelectionScreen.routeName: (ctx) => const AreaSelectionScreen(),
          VotingScreen.routeName: (ctx) => const VotingScreen(),
        },
      ),
    );
  }
}
