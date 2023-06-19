import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final String userId = FirebaseAuth.instance.currentUser!.email.toString();

class RequirementAdd {
  Future<void> addFromClient(
      String documentId,
      int hours,
      int professionals,
      String cleaningType,
      String dateAndTime,
      String location,
      String nameInfo,
      String contactInfo) async {
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
          'documentId': userId,
          'hours': hours,
          'professional': professionals,
          'cleanigtype': cleaningType,
          'datetime': dateAndTime,
          'location': location,
          'contactname': nameInfo,
          'contactnumber': contactInfo,
          'status': null,
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
