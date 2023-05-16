import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'm1.dart';

class Message extends StatefulWidget {
  const Message({super.key});

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  bool isAhu = false;
  void initState() {
    // TODO: implement initState
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        setState(() {
          isAhu = true;
        });
      }
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    if (isAhu) {
      return StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("chat")
              .orderBy('createdAt', descending: true)
              .snapshots(),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }

            final docs = snapshot.data!.docs;
            final user = FirebaseAuth.instance.currentUser;
            return ListView.builder(
              reverse: true,
              itemCount: docs.length,
              itemBuilder: (ctx, index) => Message_bubble(
                docs[index]["text"],
                docs[index]["username"],
                docs[index]["userId"] == user!.uid ? true : false,
              ),
            );
          });
    }
    return Center(
      child: Text("Please Login"),
    );
  }
}
