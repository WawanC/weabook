import 'package:flutter/material.dart';
import 'screens/navigation.dart';
import 'screens/search_screen.dart';
import 'screens/anime_detail_screen.dart';
import 'screens/anime_review_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Weabook",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      home: Navigation(),
      routes: {
        SearchScreen.routeName: (ctx) => SearchScreen(),
        AnimeDetailScreen.routeName: (ctx) => AnimeDetailScreen(),
        AnimeReviewScreen.routeName: (ctx) => AnimeReviewScreen(),
      },
    );
  }
}
