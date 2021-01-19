import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {
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
            leading: Container(
              width: 50,
              decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            title: Text(
              "Player post a review :",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text("Anime Title"),
            trailing: Icon(Icons.arrow_forward_ios_sharp),
          ),
        );
      },
      itemCount: 4,
      reverse: true,
    );
  }
}
