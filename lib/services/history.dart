import 'package:cloud_firestore/cloud_firestore.dart';

Stream<List<Map<String, dynamic>>> getUserRequirementsHistoryStream(
    {required String userId}) {
  return FirebaseFirestore.instance
      .collection('orders')
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
