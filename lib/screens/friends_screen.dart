import 'package:flutter/material.dart';

class FriendsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(10),
      itemBuilder: (bctx, idx) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            onTap: () {},
            contentPadding: EdgeInsets.all(10),
            leading: CircleAvatar(
              child: null,
            ),
            title: Text(
              "Friend Name",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Currently Watching :",
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
                Text(
                  "Anime Title",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            trailing: Icon(Icons.arrow_forward_ios_sharp),
          ),
        );
      },
      itemCount: 5,
    );
  }
}
