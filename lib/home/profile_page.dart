import 'package:flutter/material.dart';
import 'package:importan_skripsi/theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  // const ProfilePage({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   Widget header() {
  //     return AppBar(
  //       backgroundColor: primaryColor,
  //       automaticallyImplyLeading: false,
  //       elevation: 0,
  //       flexibleSpace: SafeArea(
  //         child: Container(
  //           padding: EdgeInsets.all(
  //             defaultMargin,
  //           ),
  //           child: Row(
  //             children: [
  //               ClipOval(
  //                 child: Image.asset(
  //                   'assets/show_image.png',
  //                   width: 64,
  //                 ),
  //               ),
  //               SizedBox(
  //                 width: 16,
  //               ),
  //               Expanded(
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Text(
  //                       'Hallo, Bebee',
  //                       style: subTitleTextStyle.copyWith(
  //                         color: Colors.white,
  //                         fontSize: 24,
  //                         fontWeight: FontWeight.w500,
  //                       ),
  //                     ),
  //                     Text(
  //                       '@Bebee',
  //                       style: titleTextStyle.copyWith(
  //                         fontSize: 16,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //               GestureDetector(
  //                 onTap: () {
  //                   Navigator.pushNamedAndRemoveUntil(
  //                       context, '/sign-in', (route) => false);
  //                 },
  //                 child: Image.asset(
  //                   'assets/btn_exit.png',
  //                   width: 40,
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     );
  //   }

  //   Widget menuItem(String text) {
  //     return Container(
  //       margin: EdgeInsets.only(
  //         top: 16,
  //       ),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           Text(
  //             text,
  //             style: subTitleTextStyle.copyWith(
  //               fontSize: 13,
  //               fontWeight: FontWeight.w400,
  //             ),
  //           ),
  //           Icon(
  //             Icons.chevron_right,
  //             color: Colors.black,
  //           ),
  //         ],
  //       ),
  //     );
  //   }

  //   Widget content() {
  //     return Expanded(
  //       child: Container(
  //         width: double.infinity,
  //         padding: EdgeInsets.symmetric(
  //           horizontal: defaultMargin,
  //         ),
  //         decoration: BoxDecoration(),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             SizedBox(
  //               height: 20,
  //             ),
  //             Text(
  //               'Account',
  //               style: subTitleTextStyle.copyWith(
  //                 fontSize: 16,
  //                 fontWeight: FontWeight.w500,
  //                 color: primaryColor,
  //               ),
  //             ),
  //             GestureDetector(
  //               onTap: () {
  //                 Navigator.pushNamed(
  //                   context,
  //                   '/edit-profile',
  //                 );
  //               },
  //               child: menuItem(
  //                 'Edit Profile',
  //               ),
  //             ),
  //             menuItem(
  //               'Help',
  //             ),
  //           ],
  //         ),
  //       ),
  //     );
  //   }

  //   return Column(
  //     children: [
  //       header(),
  //       content(),
  //     ],
  //   );
  // }
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
            decoration: BoxDecoration(
                color: primaryColor, borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/show_image.png'),
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
                  'Bebee',
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
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/sign-in', (route) => false);
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
