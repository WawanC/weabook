import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 200,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Colors.blue.shade700,
            child: Text(
              "Weabook",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.chat),
            title: Text("Ghibah Room"),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.account_circle),
            title: Text("My Account"),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.info),
            title: Text("About"),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.exit_to_app,
              color: Colors.red,
            ),
            title: Text(
              "Log-Out",
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
