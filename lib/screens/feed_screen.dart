import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../helpers/jikan.dart';

class FeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('/reviews').snapshots(),
      builder: (bctx, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        List<Map<String, dynamic>> reviewsData = [];
        snapshot.data.docs.forEach((element) {
          reviewsData.add({
            "animeId": element["animeId"],
            "user": element["user"],
            "stars": element["stars"],
            "comment": element["comment"],
          });
        });
        return ListView.builder(
          padding: EdgeInsets.all(10),
          itemBuilder: (bctx, idx) {
            return FutureBuilder(
                future: FirebaseFirestore.instance
                    .collection('users')
                    .doc(reviewsData[idx]["user"])
                    .get(),
                builder: (bctx, AsyncSnapshot<DocumentSnapshot> userSnapshot) {
                  if (userSnapshot.connectionState == ConnectionState.waiting) {
                    return Card(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: LinearProgressIndicator(value: 1,),
                      ),
                    );
                  }
                  return FutureBuilder(
                    future: getAnimeDetail(reviewsData[idx]["animeId"]),
                    builder: (bctx, animeSnapshot) {
                      if (animeSnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Card(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: LinearProgressIndicator(value: 1,),
                          ),
                        );
                      }
                      final user = userSnapshot.data.data();
                      final anime = animeSnapshot.data;
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          onTap: () {},
                          contentPadding: EdgeInsets.all(10),
                          leading: Container(
                            width: 50,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.network(
                              anime['image_url'],
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(
                            "${user['username']} post a review :",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text("${anime['title']}"),
                          trailing: Icon(Icons.arrow_forward_ios_sharp),
                        ),
                      );
                    },
                  );
                });
          },
          itemCount: reviewsData.length,
          reverse: true,
        );
      },
    );
  }
}
