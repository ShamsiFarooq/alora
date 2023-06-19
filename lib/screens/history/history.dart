import 'package:alora/style/style.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HistoryScreen extends StatelessWidget {
  final String userId;

  const HistoryScreen({required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color1,
      appBar: AppBar(
        title: Text('Requirement History'),
      ),
      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: getUserRequirementsHistoryStream(userId: userId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Map<String, dynamic>> userRequirementsHistory = snapshot.data!;
            return ListView.builder(
              itemCount: userRequirementsHistory.length,
              itemBuilder: (context, index) {
                final requirement = userRequirementsHistory[index];
                final status = requirement['status'];

                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: color2,
                      borderRadius: BorderRadius.circular(29),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(
                          'Status: $status',
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            height15,
                            Text(
                              'Date and Time: ${requirement['datetime']}',
                              style: const TextStyle(
                                fontSize: 16,
                                color: color5,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Hours: ${requirement['hours']}',
                              style: const TextStyle(
                                fontSize: 16,
                                color: color5,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Professional: ${requirement['professional']}',
                              style: const TextStyle(
                                fontSize: 16,
                                color: color5,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Location: ${requirement['location']}',
                              style: const TextStyle(
                                fontSize: 16,
                                color: color5,
                                fontWeight: FontWeight.bold,
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

Stream<List<Map<String, dynamic>>> getUserRequirementsHistoryStream(
    {required String userId}) {
  return FirebaseFirestore.instance
      .collection('users')
      .doc(userId)
      .snapshots()
      .map((snapshot) {
    List<Map<String, dynamic>> userRequirementsHistory = [];
    final userRequirementData = snapshot.data();
    if (userRequirementData != null) {
      final userRequirementsList =
          userRequirementData['userrequirement'] as List<dynamic>;
      for (var requirement in userRequirementsList) {
        if (requirement is Map<String, dynamic>) {
          if (requirement['status'] == null) {
            requirement['status'] = 'Pending';
          }
          userRequirementsHistory.add(requirement);
        }
      }
    }
    return userRequirementsHistory;
  });
}
