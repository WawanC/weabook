import 'package:flutter/material.dart';
import '../widgets/review/stars_widget.dart';
import '../widgets/review/comment_widget.dart';
import '../helpers/jikan.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AnimeReviewScreen extends StatefulWidget {
  static final String routeName = '/anime-review';
  @override
  _AnimeReviewScreenState createState() => _AnimeReviewScreenState();
}

class _AnimeReviewScreenState extends State<AnimeReviewScreen> {
  final uid = FirebaseAuth.instance.currentUser.uid;
  int animeId;
  Map<String, dynamic> animeData;
  bool isInit = false;
  bool isLoading = false;
  var result = {
    "stars": 0,
    "comment": "",
  };

  void submitStar(int star) {
    result['stars'] = star;
  }

  void submitComment(String comment) {
    result['comment'] = comment;
  }

  @override
  void didChangeDependencies() {
    if (!isInit) {
      animeId = ModalRoute.of(context).settings.arguments;
      isLoading = true;
      getAnimeDetail(animeId).then((value) {
        animeData = value;
        setState(() {
          isLoading = false;
        });
      });
      isInit = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Review Anime"),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: Image.network(
                      animeData["image_url"],
                      fit: BoxFit.cover,
                    ),
                    height: 200,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      animeData["title"],
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
                  StarsWidget(submitStar),
                  CommentWidget(submitComment),
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
            onPressed: () async {
              FocusScope.of(context).unfocus();
              await FirebaseFirestore.instance.collection('reviews').add({
                "animeId": animeData['mal_id'],
                "user": uid,
                'stars': result['stars'],
                'comment': result['comment'],
              });
              print(result);
              Navigator.of(context).popUntil(ModalRoute.withName('/'));
            },
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
