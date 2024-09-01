import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:importan_skripsi/models/user_model.dart';
import 'package:importan_skripsi/services/db.dart';
import 'package:importan_skripsi/theme.dart';
import 'package:importan_skripsi/widgets/information_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserModel? user;
  String? photoUrl;
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

  @override
  Widget build(BuildContext context) {
    Widget header(String? photoUrl) {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hallo ${user?.name ?? ''}',
                    style: subTitleTextStyle.copyWith(fontSize: 24, fontWeight: FontWeight.w600, color: primaryColor),
                  ),
                  if (user != null) ...[
                    Text(
                      '@${user?.name?.toLowerCase().replaceAll(' ', '')}',
                      style: titleTextStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            if (photoUrl != null) ...[
              Container(
                width: 54,
                height: 54,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.network(photoUrl),
              ),
            ],
          ],
        ),
      );
    }

    Widget informationTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Text(
          'Information',
          style: subTitleTextStyle.copyWith(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }

    Widget Information() {
      return Container(
        margin: const EdgeInsets.only(
          top: 14,
        ),
        child: const Column(
          children: [
            InformationTile(),
          ],
        ),
      );
    }

    return ListView(
      children: [
        header(photoUrl),
        informationTitle(),
        Information(),
      ],
    );
  }
}
