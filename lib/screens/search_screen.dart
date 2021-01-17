import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  static final String routeName = '/search';
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: "Enter your Anime title here...",
          ),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemBuilder: (bctx, idx) => Column(
          children: [
            ListTile(
              onTap: () {},
              leading: Container(
                width: 50,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
              ),
              title: Text("Anime Title"),
            ),
            Divider(),
          ],
        ),
        itemCount: 5,
      ),
    );
  }
}
