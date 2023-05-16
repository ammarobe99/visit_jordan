import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final _controller = TextEditingController();
  String _enterdmessage = "";
  String UserId = '';
  String UserName = '';
  void _sendmessage() async {
    FocusScope.of(context).unfocus();
    final user = FirebaseAuth.instance.currentUser;
    final userData = FirebaseFirestore.instance.collection("chat").add({
      'text': _enterdmessage,
      "createdAt": Timestamp.now(),
      "username": UserName,
      "userId": user!.uid,
    }).then((value) => {
          _controller.clear(),
          setState(() {
            _enterdmessage = "";
          })
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        FirebaseFirestore.instance
            .collection("user")
            .doc(user.uid)
            .get()
            .then((value) {
          setState(() {
            UserId = user.uid;
            UserName = value["username"];
          });
        });
        print('User is signed in!');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
              child: TextField(
            controller: _controller,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                labelText: ("send a message ...")),
            onChanged: (value) {
              setState(() {
                _enterdmessage = value;
              });
            },
          )),
          UserId == ''
              ? Container()
              : IconButton(
                  onPressed: (() {
                    if (_enterdmessage != "") {
                      _sendmessage();
                    }
                  }),
                  icon: Icon(Icons.send),
                  color: Color.fromARGB(255, 156, 182, 255),
                )
        ],
      ),
    );
  }
}
