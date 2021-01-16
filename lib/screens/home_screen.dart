import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 100,
            padding: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text(
              'Hello Player',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
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
        ],
      ),
    );
  }
}
