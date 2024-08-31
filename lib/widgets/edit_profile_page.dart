import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:importan_skripsi/theme.dart';
import 'package:importan_skripsi/utils.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  Uint8List? _image;

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
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
              style: subTitleTextStyle,
              decoration: InputDecoration(
                hintText: 'Bebee',
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

    Widget usernameInput() {
      return Container(
        margin: const EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name',
              style: titleTextStyle.copyWith(
                fontSize: 13,
              ),
            ),
            TextFormField(
              style: subTitleTextStyle,
              decoration: InputDecoration(
                hintText: '@Bebee',
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
              style: subTitleTextStyle,
              decoration: InputDecoration(
                hintText: 'Bebee@gmail.com',
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
              style: subTitleTextStyle,
              decoration: InputDecoration(
                hintText: 'Bebee',
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
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/show_image.png',
                      ),
                    ),
                  ),
                ),
                Positioned(
                  child: IconButton(
                    onPressed: selectImage,
                    icon: Icon(Icons.add_a_photo),
                  ),
                  bottom: -15,
                  left: 60,
                ),
              ],
            ),
            nameInput(),
            usernameInput(),
            emailInput(),
            passwordInput(),
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
