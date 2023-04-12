import 'package:alora/style/constant.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

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
          backgroundColor: color5,
          title: const Text("Ask me"),
          centerTitle: true,
        ),
        backgroundColor: color1,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(child: Container()),
              Container(
                color: color2,
                child: const TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(8),
                      hintText: 'Type ur msg'),
                ),
              )
            ],
          ),
        ));
  }
}
