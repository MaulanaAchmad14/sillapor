import 'package:cloud_firestore/cloud_firestore.dart';

class Create {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addUser({
    required String fullName,
    required int phone,
    required String emailAddress,
    required String Password,
  }) {
    // Dapatkan referensi koleksi 'users' dari Firestore
    CollectionReference users = firestore.collection('DataUser');

    // Tambahkan pengguna baru dengan data yang sesuai, termasuk tanggal yang dipilih
    return users
        .add({
          'full_name': fullName,
          'phone': phone,
          'email_address': emailAddress,
          'password': Password,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
