import 'package:flutter/material.dart';
import 'package:weabook/screens/home_screen.dart';
import 'screens/navigation.dart';
import 'screens/search_screen.dart';
import 'screens/anime_detail_screen.dart';
import 'screens/anime_review_screen.dart';
import 'screens/auth_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (bctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: "Weabook",
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: 'Poppins',
            ),
            home: StreamBuilder(
              stream: FirebaseAuth.instance.userChanges(),
              builder: (bctx, snapshot) {
                if (snapshot.hasData) return Navigation();
                return AuthScreen();
              },
            ),
            routes: {
              SearchScreen.routeName: (ctx) => SearchScreen(),
              AnimeDetailScreen.routeName: (ctx) => AnimeDetailScreen(),
              AnimeReviewScreen.routeName: (ctx) => AnimeReviewScreen(),
            },
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
