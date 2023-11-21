import 'package:alora/services/history.dart';
import 'package:alora/view/bottomnav/bottom_navigation.dart';
import 'package:alora/view/style/style.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  final String userId;

  const HistoryScreen({required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Order History',
          style: TextStyle(color: color1, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: colorBlack,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BottomNavBar(),
                ),
              );
            },
            child: Icon(
              Icons.arrow_back,
              color: color1,
            )),
      ),
      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: getUserRequirementsHistoryStream(userId: userId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Map<String, dynamic>> userRequirementsHistory = snapshot.data!;
            return ListView.builder(
              itemCount: userRequirementsHistory.length,
              itemBuilder: (context, index) {
                final reversedIndex =
                    userRequirementsHistory.length - 1 - index;
                final requirement = userRequirementsHistory[reversedIndex];
                final status = requirement['status'];
                final color = reversedIndex % 2 == 0
                    ? Color.fromARGB(255, 215, 44, 245) // First color
                    : Colors.lightBlue; // Second color // Second color

                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(
                          'Status: $status',
                          style: const TextStyle(
                            fontSize: 18,
                            color: color1,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            height15,
                            Text(
                              'Date and Time: ${requirement['date']}',
                              style: const TextStyle(
                                fontSize: 16,
                                color: color1,
                              ),
                            ),
                            Text(
                              'Hours: ${requirement['hours']}',
                              style: const TextStyle(
                                fontSize: 16,
                                color: color1,
                              ),
                            ),
                            Text(
                              'Professional: ${requirement['professional']}',
                              style: const TextStyle(
                                fontSize: 16,
                                color: color1,
                              ),
                            ),
                            Text(
                              'Location: ${requirement['location']}',
                              style: const TextStyle(
                                fontSize: 16,
                                color: color1,
                              ),
                            ),
                            // Add more details as needed
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
