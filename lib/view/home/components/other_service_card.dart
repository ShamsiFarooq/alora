import 'package:alora/view/chat/chat.dart';
import 'package:alora/services/database.dart';
import 'package:alora/view/style/style.dart';
import 'package:flutter/material.dart';

class OtherServiceCard extends StatelessWidget {
  final String image;
  final String name;

  const OtherServiceCard({super.key, required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return UserChatScreen(
                userId: uidd,
              );
            },
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: color3,
            width: 3,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 60,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                ),
              ),
            ),
            height15,
            Text(
              name,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: color5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}