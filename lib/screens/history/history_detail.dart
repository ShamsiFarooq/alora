import 'package:alora/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HistoryDetailScreen extends StatelessWidget {
  const HistoryDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: color1,
      appBar: AppBar(
        backgroundColor: color5,
        title: const Text('Your Booking'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            height15,
            Container(
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
                children: [
                  const Text(
                    "Date",
                    style: TextStyle(
                      color: color5,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Service Name',
                    style: TextStyle(
                      color: color5,
                      fontSize: 16,
                    ),
                  ),
                  height15,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      cancelOrRescheduleButton(
                          name: 'Cancel', color: Colors.red),
                      cancelOrRescheduleButton(
                          name: 'Reschedule', color: color5)
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

ElevatedButton cancelOrRescheduleButton(
    {required String name, required Color color}) {
  return ElevatedButton(
    onPressed: () {},
    child: Text(name),
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(29),
      ),
    ),
  );
}
