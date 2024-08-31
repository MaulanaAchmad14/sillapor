import 'package:flutter/material.dart';
import 'package:importan_skripsi/services/create.dart';
import 'package:importan_skripsi/theme.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final Create _create = Create();

  TextEditingController report = TextEditingController();
  @override
  void dispose() {
    report.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        title: const Text(
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
                    controller: report,
                    maxLines: null,
                    style: subTitleTextStyle.copyWith(
                      fontSize: 14,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Apa keluhan anda?',
                      hintStyle: subTitleTextStyle.copyWith(
                        fontSize: 14,
                      ),
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
          onPressed: () async {
            final String reportValue = report.text;

            await _create.addReport(report: reportValue);

            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => ReportPage()));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
          ),
          child: const Text(
            'Kirim',
            style: TextStyle(fontSize: 16, color: Colors.white),
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
      appBar: header(),
      body: ListView(
        children: [
          body(),
        ],
      ),
    );
  }
}
