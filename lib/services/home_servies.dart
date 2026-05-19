import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeServices {

  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>>
      getProfiles() {

    final currentUid =
        FirebaseAuth.instance.currentUser!.uid;

    return _firestore
        .collection('profiles')
        .where(
          'uid',
          isNotEqualTo: currentUid,
        )
        .orderBy('uid')
        .orderBy(
          'createdAt',
          descending: true,
        )
        .snapshots();
  }
}