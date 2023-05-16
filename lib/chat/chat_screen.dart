import 'package:flutter/material.dart';

import 'm2.dart';
import 'm3.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Welcome to chat group! "),
          backgroundColor: Color.fromARGB(255, 0, 0, 0)),
      body: Column(
        children: [
          Expanded(child: Message()),
          NewMessage(),
        ],
      ),
    );
  }
}
