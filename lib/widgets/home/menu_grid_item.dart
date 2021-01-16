import 'package:flutter/material.dart';

class MenuGridItem extends StatelessWidget {
  final String title;
  final IconData icon;
  MenuGridItem(this.title, this.icon);
  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue.shade200,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50,
            ),
            Container(
              width: 100,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 24,
                ),
                textAlign: TextAlign.center,
                softWrap: true,
                overflow: TextOverflow.fade,
              ),
            ),
          ],
        ),
        alignment: Alignment.center,
      ),
    );
  }
}
