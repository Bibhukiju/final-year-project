import 'package:election/screens/result_screen.dart';
import 'package:flutter/material.dart';

import 'package:election/constants/styles.dart';
import 'package:election/providers/election_provider.dart';
import 'package:election/providers/notice_provider.dart';
import 'package:election/screens/credential_selection_screen.dart';
import 'package:provider/provider.dart';
import 'package:election/providers/candidate_provider.dart';
import 'package:election/screens/election_screen.dart';
import 'package:election/screens/area_selection_screen.dart';
import 'package:election/screens/voting_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NoticeProvider()),
        ChangeNotifierProvider(create: (context) => ElectionProvider()),
        ChangeNotifierProvider(create: (context) => CandidateProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MeroVote',
        theme: Styles.themeData,
        home: const HomeScreen(),
        routes: {
          ElectionScreen.routeName: (ctx) => const ElectionScreen(),
          AreaSelectionScreen.routeName: (ctx) => const AreaSelectionScreen(),
          CredentialSelectionScreen.routeName: (ctx) =>
              const CredentialSelectionScreen(),
          VotingScreen.routeName: (ctx) => const VotingScreen(),
          ResultScreen.routeName: (ctx) => const ResultScreen(),
        },
      ),
    );
  }
}
