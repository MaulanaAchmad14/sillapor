import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:importan_skripsi/models/user_model.dart';

class Database {
  static Future<UserModel> getUser() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    final user = await FirebaseFirestore.instance.collection('DataUser').doc(uid).get();
    final data = user.data();
    return UserModel.fromJson(data!);
  }

  static Future<void> createUser({required String uid, required UserModel user}) async {
    DocumentReference users = FirebaseFirestore.instance.collection('DataUser').doc(uid);
    users.set(user.toJson(), SetOptions(merge: true));
  }
}
