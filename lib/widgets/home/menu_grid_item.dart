import 'package:flutter/material.dart';

class MenuGridItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function clickHandler;
  MenuGridItem(
    this.title,
    this.icon,
    this.clickHandler,
  );
  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.blue.shade100,
          borderRadius: BorderRadius.circular(20),
        ),
        child: InkWell(
          onTap: clickHandler,
          splashColor: Colors.blue,
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
        ),
      ),
    );
  }
}
