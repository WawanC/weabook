import 'package:flutter/material.dart';

class AnimeDetailScreen extends StatelessWidget {
  static final String routeName = "/anime-detail";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Anime Title Here"),
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            color: Colors.yellow,
          ),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 10,
            ),
            width: 300,
            alignment: Alignment.center,
            child: Text(
              "Anime Title",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text("Genre : XXX XXX"),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            margin: EdgeInsets.symmetric(vertical: 10),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Description :",
                ),
                Text("                xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
