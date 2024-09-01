import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:importan_skripsi/models/user_model.dart';
import 'package:importan_skripsi/services/db.dart';
import 'package:importan_skripsi/theme.dart';
import 'package:importan_skripsi/widgets/primary_button.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  UserModel? user;
  String? photoUrl;
  File? photo;
  final nameText = TextEditingController();
  final emailText = TextEditingController();
  final passwordText = TextEditingController();
  // final _userStream =
  //     FirebaseFirestore.instance.collection('DataInformation').snapshots();
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    user = await Database.getUser();
    photoUrl = await FirebaseStorage.instance.ref(FirebaseAuth.instance.currentUser?.uid).getDownloadURL();
    setState(() {});
  }

  void update() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (photo != null) {
      await FirebaseStorage.instance.ref(uid).putFile(photo!);
    }

    if (nameText.text.isNotEmpty) {
      await Database.createUser(uid: uid!, user: UserModel(name: nameText.text, phone: user?.phone));
    }

    if (passwordText.text.isNotEmpty) {
      FirebaseAuth.instance.currentUser?.updatePassword(passwordText.text);
    }

    if (emailText.text.isNotEmpty) {
      FirebaseAuth.instance.currentUser?.updateEmail(emailText.text);
    }

    if (mounted) Navigator.pop(context);
    if (mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Berhasil update data')));
  }

  @override
  void dispose() {
    nameText.dispose();
    emailText.dispose();
    passwordText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Edit Profile',
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {},
          ),
        ],
      );
    }

    Widget nameInput() {
      return Container(
        margin: const EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Full Name',
              style: titleTextStyle.copyWith(
                fontSize: 13,
              ),
            ),
            TextFormField(
              controller: nameText,
              style: subTitleTextStyle,
              decoration: InputDecoration(
                hintText: user?.name ?? '',
                hintStyle: subTitleTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: primaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget emailInput() {
      return Container(
        margin: const EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email',
              style: titleTextStyle.copyWith(
                fontSize: 13,
              ),
            ),
            TextFormField(
              controller: emailText,
              style: subTitleTextStyle,
              decoration: InputDecoration(
                hintText: FirebaseAuth.instance.currentUser?.email ?? '',
                hintStyle: subTitleTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: primaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget passwordInput() {
      return Container(
        margin: const EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password',
              style: titleTextStyle.copyWith(
                fontSize: 13,
              ),
            ),
            TextFormField(
              controller: passwordText,
              obscureText: true,
              style: subTitleTextStyle,
              decoration: InputDecoration(
                hintText: '',
                hintStyle: subTitleTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: primaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  margin: EdgeInsets.only(
                    top: defaultMargin,
                  ),
                  decoration: photo != null
                      ? BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: FileImage(
                              photo!,
                            ),
                          ),
                        )
                      : photoUrl != null
                          ? BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(
                                  photoUrl!,
                                ),
                              ),
                            )
                          : const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/show_image.png',
                                ),
                              ),
                            ),
                ),
                Positioned(
                  bottom: -15,
                  left: 60,
                  child: IconButton(
                    onPressed: () async {
                      final picker = ImagePicker();
                      final file = await picker.pickImage(source: ImageSource.gallery);
                      if (file != null) {
                        photo = File(file.path);
                        setState(() {});
                      }
                    },
                    icon: const Icon(Icons.add_a_photo),
                  ),
                ),
              ],
            ),
            nameInput(),
            emailInput(),
            passwordInput(),
            const SizedBox(height: 50),
            PrimaryButton(label: "Update", onPressed: update),
          ],
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white, // Warna latar belakang putih
      body: ListView(
        children: [
          header(),
          content(),
        ],
      ),
    );
  }
}
