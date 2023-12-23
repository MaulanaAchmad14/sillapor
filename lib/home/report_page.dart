import 'package:flutter/material.dart';
import 'package:importan_skripsi/theme.dart';

class ReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Laporkan Keluhan Anda',
        ),
      );
    }

    Widget reportInput() {
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
                    'Silahkan berkeluh kesah',
                    style: subTitleTextStyle.copyWith(
                      fontSize: 13,
                    ),
                  ),
                  TextFormField(
                    maxLines: null,
                    style: subTitleTextStyle,
                    decoration: InputDecoration(
                      hintText: 'Apa keluhan anda?',
                      hintStyle: subTitleTextStyle,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor, width: 2.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget sendButton() {
      return Container(
        margin: EdgeInsets.symmetric(
          vertical: defaultMargin,
          horizontal: defaultMargin,
        ),
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            // Add your logic to handle the send button press
            // For example, you can send the complaint to a server.
          },
          style: ElevatedButton.styleFrom(
            primary: primaryColor,
          ),
          child: Text(
            'Kirim',
            style: TextStyle(fontSize: 16),
          ),
        ),
      );
    }

    Widget body() {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            reportInput(),
            sendButton(),
          ],
        ),
      );
    }

    return Scaffold(
      body: ListView(
        children: [
          header(),
          body(),
        ],
      ),
    );
  }
}
