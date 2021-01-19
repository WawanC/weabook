import 'package:flutter/material.dart';
import '../widgets/home/menu_grid_item.dart';
import './search_screen.dart';
import './watch_history_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatelessWidget {
  final uid = FirebaseAuth.instance.currentUser.uid;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('/users')
            .doc(uid)
            .snapshots(),
        builder: (bctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    height: 100,
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello ${snapshot.data["username"]}',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          child: Text(
                            'Your Points : ${snapshot.data['points']}',
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListTile(
                      // leading: Container(
                      //   width: 40,
                      //   decoration: BoxDecoration(
                      //     border: Border.all(width: 1),
                      //     borderRadius: BorderRadius.circular(10),
                      //   ),
                      // ),
                      title: Text("I'm Currently Watching : "),
                      subtitle: snapshot.data["currentlyWatch"] == null
                          ? Text("None")
                          : Text(snapshot.data["currentlyWatch"].toString()),
                      trailing: IconButton(
                        icon: Icon(Icons.arrow_forward_ios_sharp),
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                              SearchScreen.routeName,
                              arguments: "currentlyWatch");
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: GridView(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                        ),
                        children: [
                          MenuGridItem(
                            'Search Anime',
                            Icons.search,
                            () {
                              Navigator.of(context).pushNamed(
                                  SearchScreen.routeName,
                                  arguments: "searchAnime");
                            },
                          ),
                          MenuGridItem(
                            'Post a Review',
                            Icons.star,
                            () {
                              Navigator.of(context).pushNamed(
                                  SearchScreen.routeName,
                                  arguments: "postReview");
                            },
                          ),
                          MenuGridItem(
                            'Anime Rank',
                            Icons.leaderboard,
                            () {},
                          ),
                          MenuGridItem(
                            'Watch History',
                            Icons.history,
                            () {
                              Navigator.of(context)
                                  .pushNamed(WatchHistoryScreen.routeName);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        });
  }
}
