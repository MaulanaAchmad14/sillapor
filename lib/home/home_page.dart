import 'package:flutter/material.dart';
import 'package:importan_skripsi/theme.dart';
import 'package:importan_skripsi/widgets/information_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
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
                    'Hallo Bebee',
                    style: subTitleTextStyle.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: primaryColor),
                  ),
                  Text(
                    '@bebee',
                    style: titleTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(
                    'assets/show_image.png',
                  ),
                ),
              ),
            ),
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
        margin: EdgeInsets.only(
          top: 14,
        ),
        child: Column(
          children: [
            InformationTile(),
          ],
        ),
      );
    }

    return ListView(
      children: [
        header(),
        informationTitle(),
        Information(),
      ],
    );
  }
}
