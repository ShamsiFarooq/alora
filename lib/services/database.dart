import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final String userId = FirebaseAuth.instance.currentUser!.email.toString();
final currentUser = FirebaseAuth.instance.currentUser;
final String uidd = currentUser?.uid as String;

class DatabaseServices {
  final String? uid;
  DatabaseServices({this.uid});

  final CollectionReference audibleCollection =
      FirebaseFirestore.instance.collection('users');
  Future addUserData({
    String? name,
    String? email,
    String? password,
    String? googleId,
  }) async {
    final collectionId = audibleCollection.doc(uid);
    return await collectionId.set({
      'id': collectionId.id,
      'username': name,
      'mail': email,
      'password': password,
    });
  }

  Future<void> addUserRequirement(
      String documentId,
      int hours,
      int professionals,
      String cleaningType,
      String dateTo,
      String timeTo,
      String location,
      String nameInfo,
      String contactInfo) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final CollectionReference orderCollection = firestore.collection("orders");
    final DocumentSnapshot userDoc = await orderCollection.doc(userId).get();
    if (!userDoc.exists) {
      await orderCollection.doc(userId).set({'userrequirement': []});
    }
    try {
      final docData = await FirebaseFirestore.instance
          .collection("orders")
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
          'date': dateTo,
          'time': timeTo,
          'location': location,
          'contactname': nameInfo,
          'contactnumber': contactInfo,
          'status': null,
        });
        await FirebaseFirestore.instance
            .collection('orders')
            .doc(userId)
            .update({'userrequirement': custemerRequirement});
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
