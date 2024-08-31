import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:importan_skripsi/theme.dart';

class InformationTile extends StatefulWidget {
  const InformationTile({super.key});

  @override
  State<InformationTile> createState() => _InformationTileState();
}

class _InformationTileState extends State<InformationTile> {
  final _userStream =
      FirebaseFirestore.instance.collection('DataInformation').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _userStream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('data error');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('loading');
        }

        var docs = snapshot.data!.docs;

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: docs.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(
                left: defaultMargin,
                right: defaultMargin,
                bottom: defaultMargin,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white.withOpacity(0.75),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 0,
                      blurRadius: 1.5,
                      offset: Offset(0, 0),
                    )
                  ]),
              child: ListTile(
                title: Text(
                  docs[index]['title'],
                  style: subTitleTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
