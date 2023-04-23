import 'package:bakery_app/common/controllers/base_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../common/styles/app_themes.dart';

final _firestore = FirebaseFirestore.instance;
final _firebaseAuth = FirebaseAuth.instance;

class ChatController extends BaseController {
  Rx<TextEditingController> msgCtr = TextEditingController().obs;
  sendMessage() {
    _firestore
        .collection('messages')
        .doc(_firebaseAuth.currentUser!.uid)
        .collection(_firebaseAuth.currentUser!.uid)
        .add({
      "message": msgCtr.value.text,
      "sentBy": _firebaseAuth.currentUser!.uid,
      'time': DateTime.now(),
    });
    msgCtr.value.clear();
  }
}

Widget sendMessageWidget({required String content, required String time}) {
  return Align(
    alignment: const Alignment(1, 0),
    child: Padding(
      padding:
          const EdgeInsets.only(right: 8.0, left: 50.0, top: 4.0, bottom: 4.0),
      child: Container(
        constraints: const BoxConstraints(minWidth: 50, maxWidth: 250),
        child: Material(
          elevation: 3.0,
          color: AppThemes.primary,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
                right: 12.0, left: 12.0, top: 8.0, bottom: 8.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    content,
                    style: const TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    time,
                    style: TextStyle(
                        fontSize: 10, color: Colors.black.withOpacity(0.8)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Widget receivedMessageWidget({required String content, required String time}) {
  return Align(
    alignment: const Alignment(-1, 0),
    child: Padding(
      padding:
          const EdgeInsets.only(right: 75.0, left: 8.0, top: 8.0, bottom: 8.0),
      child: Container(
        constraints: const BoxConstraints(minWidth: 50, maxWidth: 250),
        child: Material(
          elevation: 3.0,
          color: AppThemes.background,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(16),
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
                right: 12.0, left: 12.0, top: 8.0, bottom: 16.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    content,
                    style: const TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    time,
                    style: const TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

class MessagesStream extends StatelessWidget {
  const MessagesStream({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore
          .collection('messages')
          .doc(_firebaseAuth.currentUser!.uid)
          .collection(_firebaseAuth.currentUser!.uid)
          .orderBy('time')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Text('Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }
        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            return data['sentBy'] == _firebaseAuth.currentUser!.uid
                ? sendMessageWidget(
                    content: data['message'],
                    time: DateFormat.jm()
                        .format(data['time'].toDate())
                        .toString())
                : receivedMessageWidget(
                    content: data['message'],
                    time: DateFormat.jm()
                        .format(data['time'].toDate())
                        .toString());
          }).toList(),
        );
      },
    );
  }
}
