import 'package:flutter/material.dart';
import '../helpers/jikan.dart';

class AnimeDetailScreen extends StatefulWidget {
  static final String routeName = "/anime-detail";

  @override
  _AnimeDetailScreenState createState() => _AnimeDetailScreenState();
}

class _AnimeDetailScreenState extends State<AnimeDetailScreen> {
  int animeId;
  bool firstInit = true;
  Map<String, dynamic> animeData;

  Future<void> _getAnime() async {
    animeData = await getAnimeDetail(animeId);
  }

  @override
  void didChangeDependencies() {
    if (firstInit) {
      animeId = ModalRoute.of(context).settings.arguments;
      print(animeId);
      firstInit = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getAnime(),
      builder: (bctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Wait..."),
            ),
            body: Center(child: CircularProgressIndicator()),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: Text(animeData['title']),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 300,
                    color: Colors.yellow,
                    child: Image.network(
                      animeData['image_url'],
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    width: 300,
                    alignment: Alignment.center,
                    child: Text(
                      animeData['title'],
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
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("             ${animeData['synopsis']}"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
