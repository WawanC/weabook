import 'package:flutter/material.dart';
import './home_screen.dart';
import './feed_screen.dart';
import './friends_screen.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIdx = 0;
  var _pages = [
    HomeScreen(),
    FeedScreen(),
    FriendsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Weebook",
        ),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: _pages[_selectedIdx],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIdx,
        onTap: (idx) {
          setState(() {
            _selectedIdx = idx;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: "Feed",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt),
            label: "Friends",
          ),
        ],
      ),
    );
  }
}
