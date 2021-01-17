import 'package:flutter/material.dart';
import '../widgets/review/stars_widget.dart';
import '../widgets/review/comment_widget.dart';

class AnimeReviewScreen extends StatefulWidget {
  static final String routeName = '/anime-review';
  @override
  _AnimeReviewScreenState createState() => _AnimeReviewScreenState();
}

class _AnimeReviewScreenState extends State<AnimeReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Review Anime"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.yellow,
              height: 200,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Anime Title",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            Container(
              child: Text(
                "How was it ?",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            StarsWidget(),
            CommentWidget(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Visibility(
        visible: MediaQuery.of(context).viewInsets.bottom > 0 ? false : true,
        child: Container(
          width: 150,
          child: FloatingActionButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.send),
                SizedBox(width: 5),
                Text("Post It !"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
