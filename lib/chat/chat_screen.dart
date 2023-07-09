import 'package:flutter/material.dart';

import 'm2.dart';
import 'm3details.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        children: [
          Expanded(child: Message()),
          NewMessage(),
        ],
      ),
    );
  }
}
