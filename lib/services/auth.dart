import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:importan_skripsi/models/user_model.dart';
import 'package:importan_skripsi/services/db.dart';

class AuthService {
  static Future<void> login({required String email, required String password}) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> register({required String email, required String password, required File image, required UserModel user}) async {
    try {
      final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      final uid = userCredential.user?.uid;
      await Database.createUser(uid: uid!, user: user);
      await FirebaseStorage.instance.ref(uid).putFile(image);
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> logout() async {
    FirebaseAuth.instance.signOut();
  }
}
