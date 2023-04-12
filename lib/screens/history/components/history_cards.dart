import 'package:alora/screens/history/history_detail.dart';
import 'package:alora/style/constant.dart';
import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const HistoryDetailScreen();
            },
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        padding: const EdgeInsets.only(left: 20),
        height: 120,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: color2,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Date",
              style: TextStyle(
                color: color5,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Service Name',
              style: TextStyle(
                color: color5,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
