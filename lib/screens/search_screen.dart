import 'package:flutter/material.dart';
import './anime_detail_screen.dart';
import '../helpers/jikan.dart';

class SearchScreen extends StatefulWidget {
  static final String routeName = '/search';
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<dynamic> animeList;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: "Enter your Anime title here...",
          ),
          onChanged: (value) async {
            if (value.length > 2) {
              setState(() {
                animeList = [];
                isLoading = true;
              });
              List<dynamic> animeListRaw = await searchAnime(value);
              setState(() {
                isLoading = false;
                animeList = animeListRaw;
              });
            } else {
              setState(() {
                animeList = null;
              });
            }
          },
        ),
      ),
      body: animeList == null
          ? Center(
              child: Text("Type Anime Name"),
            )
          : isLoading
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemBuilder: (bctx, idx) => Column(
                    children: [
                      ListTile(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(
                                AnimeDetailScreen.routeName,
                                arguments: animeList[idx]['mal_id'],
                              )
                              .then(
                                (value) => Navigator.of(context).pop(),
                              );
                        },
                        leading: Container(
                          width: 50,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1),
                          ),
                          child: Image.network(
                            animeList[idx]['image_url'],
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(animeList[idx]['title']),
                      ),
                      Divider(),
                    ],
                  ),
                  itemCount: 5,
                ),
    );
  }
}
