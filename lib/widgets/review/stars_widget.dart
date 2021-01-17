import 'package:flutter/material.dart';

class StarsWidget extends StatefulWidget {
  @override
  _StarsWidgetState createState() => _StarsWidgetState();
}

class _StarsWidgetState extends State<StarsWidget> {
  int currentStar = 0;
  List<String> stars = [
    'Worst',
    'Bad',
    'Average',
    'Good',
    'Best',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (bctx, idx) {
                return IconButton(
                  icon: Icon(
                    idx < currentStar ? Icons.star : Icons.star_border,
                    size: 50,
                  ),
                  onPressed: () {
                    setState(() {
                      currentStar = idx + 1;
                    });
                  },
                );
              },
              itemCount: stars.length,
            ),
          ),
          if (currentStar != 0)
            Text(
              stars[currentStar - 1],
              style: TextStyle(
                fontSize: 24,
              ),
            ),
        ],
      ),
    );
  }
}
