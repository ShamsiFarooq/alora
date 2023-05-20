import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final String userId = FirebaseAuth.instance.currentUser!.email.toString();

class RequirementAdd {
  Future<void> addFromClient(int hours, int professionals, String cleaningType,
      String dateAndTime, String location) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final CollectionReference userCollection = firestore.collection("users");
    final DocumentSnapshot userDoc = await userCollection.doc(userId).get();

    if (!userDoc.exists) {
      await userCollection.doc(userId).set({'userrequirement': []});
    }
    try {
      final docData = await FirebaseFirestore.instance
          .collection("users")
          .doc(userId)
          .get();
      if (docData.exists) {
        final List<dynamic> custemerRequirement =
            docData.data()?['userrequirement'] ?? [];
        custemerRequirement.add({
          'hours': hours,
          'professional': professionals,
          'cleanintype': cleaningType,
          'datetime': dateAndTime,
          'location': location,
        });
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .update({'userrequirement': custemerRequirement});
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
