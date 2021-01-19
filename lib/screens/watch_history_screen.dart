import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../helpers/jikan.dart';
import './anime_detail_screen.dart';

class WatchHistoryScreen extends StatelessWidget {
  static final String routeName = '/history';
  @override
  Widget build(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser.uid;
    return Scaffold(
        appBar: AppBar(
          title: Text("My Watch History"),
        ),
        body: FutureBuilder(
            future: FirebaseFirestore.instance
                .collection('reviews')
                .where('user', isEqualTo: uid)
                .get(),
            builder: (bctx, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                padding: EdgeInsets.all(10),
                itemBuilder: (bctx, idx) {
                  return FutureBuilder(
                      future:
                          getAnimeDetail(snapshot.data.docs[idx]["animeId"]),
                      builder: (bctx, animeSnapshot) {
                        if (animeSnapshot.connectionState ==
                            ConnectionState.waiting) {
                          return ListTile(
                            contentPadding: EdgeInsets.all(10),
                            title: LinearProgressIndicator(),
                          );
                        }
                        return Column(
                          children: [
                            ListTile(
                              leading: Container(
                                width: 50,
                                height: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image.network(
                                  animeSnapshot.data["image_url"],
                                  fit: BoxFit.cover,
                                ),
                              ),
                              title: Text(animeSnapshot.data["title"]),
                              subtitle: Text(
                                  snapshot.data.docs[idx]["stars"].toString() +
                                      "/5"),
                              trailing: Icon(Icons.arrow_forward_ios),
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                  AnimeDetailScreen.routeName,
                                  arguments: snapshot.data.docs[idx]["animeId"],
                                );
                              },
                            ),
                            Divider(
                              thickness: 2,
                            ),
                          ],
                        );
                      });
                },
                itemCount: snapshot.data.docs.length,
              );
            }));
  }
}
