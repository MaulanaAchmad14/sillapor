import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:importan_skripsi/models/user_model.dart';
import 'package:importan_skripsi/services/auth.dart';
import 'package:importan_skripsi/services/db.dart';
import 'package:importan_skripsi/theme.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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

  // const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0x00ffffff),
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: primaryColor,
        ),
        title: Text(
          'My Profile',
          style: subTitleTextStyle.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          const SizedBox(
            height: 40,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 22,
            ),
            decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: (photoUrl == null)
                      ? const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/show_image.png'),
                            fit: BoxFit.cover,
                          ),
                        )
                      : BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(photoUrl!),
                            fit: BoxFit.cover,
                          ),
                        ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffffffff),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.check_circle,
                          color: primaryColor,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  user?.name ?? '-',
                  style: subTitleTextStyle.copyWith(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/edit-profile');
                  },
                  child: Row(
                    children: [
                      const Image(
                        width: 26,
                        height: 26,
                        image: AssetImage(
                          'assets/ic_person.png',
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        'Edit Profile',
                        style: titleTextStyle.copyWith(
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/edit-profile');
                  },
                  child: Row(
                    children: [
                      const Image(
                        width: 26,
                        height: 26,
                        image: AssetImage(
                          'assets/ic_help.png',
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        'Bantuan',
                        style: titleTextStyle.copyWith(
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () async {
                    await AuthService.logout();
                    Navigator.pushNamedAndRemoveUntil(context, '/sign-in', (route) => false);
                  },
                  child: Row(
                    children: [
                      const Image(
                        width: 26,
                        height: 26,
                        image: AssetImage(
                          'assets/ic_logout.png',
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        'Keluar',
                        style: titleTextStyle.copyWith(
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
