import 'package:flutter/material.dart';
import '../widgets/home/menu_grid_item.dart';
import './search_screen.dart';
import './anime_review_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  'Hello Player',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    'Your Points : 690',
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
              title: Text("I'm Currently Watching :"),
              subtitle: Text("Naruto Shippuden"),
              trailing: IconButton(
                icon: Icon(Icons.arrow_forward_ios_sharp),
                onPressed: () {},
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Center(
              child: GridView(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                children: [
                  MenuGridItem(
                    'Search Anime',
                    Icons.search,
                    () {
                      Navigator.of(context).pushNamed(SearchScreen.routeName);
                    },
                  ),
                  MenuGridItem(
                    'Post a Review',
                    Icons.star,
                    () {
                      Navigator.of(context)
                          .pushNamed(AnimeReviewScreen.routeName);
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
                    () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
