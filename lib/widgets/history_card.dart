import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:importan_skripsi/theme.dart';

class HistoryCard extends StatefulWidget {
  const HistoryCard({super.key});

  @override
  State<HistoryCard> createState() => _HistoryCardState();
}

class _HistoryCardState extends State<HistoryCard> {
  final _userStream =
      FirebaseFirestore.instance.collection('DataReport').snapshots();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
      ),
      padding: const EdgeInsets.only(
        // top: 10,
        left: 12,
        bottom: 14,
        right: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xffF5F5F5),
      ),
      child: Row(
        children: [
          const SizedBox(
              // width: 12,
              ),
          Expanded(
            child: StreamBuilder(
                stream: _userStream,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text('data error');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text('loading');
                  }

                  // if (snapshot.connectionState == ConnectionState.done) {
                  var docs = snapshot.data!.docs;

                  // return Text('${docs.length}');

                  return ListView.builder(
                    shrinkWrap: true,
                    // physics: const NeverScrollableScrollPhysics(),
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
                            docs[index]['report'],
                            style: subTitleTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }
}
