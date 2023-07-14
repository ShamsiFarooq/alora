import 'package:alora/services/database.dart';
import 'package:alora/style/style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

String generateChatRoomId(String userId, String adminId) {
  final ids = [userId, adminId];
  ids.sort(); // Sort the IDs to ensure consistent chat room IDs
  final concatenatedIds = ids.join('_');
  final bytes = utf8.encode(concatenatedIds);
  final hash = sha1.convert(bytes);
  return hash.toString();
}

class UserChatScreen extends StatefulWidget {
  final String userId;
  final String adminId = 'alora_admin'; // Set the admin ID

  UserChatScreen({required this.userId});

  @override
  _UserChatScreenState createState() => _UserChatScreenState();
}

class _UserChatScreenState extends State<UserChatScreen> {
  CollectionReference messagesCollection =
      FirebaseFirestore.instance.collection('messages');

  String chatRoomId = '';

  @override
  void initState() {
    super.initState();
    getChatRoomId();
  }

  void getChatRoomId() {
    chatRoomId = generateChatRoomId(widget.userId, widget.adminId);
  }

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Chat Room'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: messagesCollection
                  .doc(chatRoomId)
                  .collection('messages')
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  final messages = snapshot.data!.docs.map((doc) {
                    final data = doc.data() as Map<String, dynamic>;

                    return ChatMessage(
                      sender: data['sender'],
                      message: data['message'],
                    );
                  }).toList();

                  return ListView.builder(
                    reverse: true,
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final message = messages[index];
                      final bool isCurrentUser =
                          message.sender == widget.userId;
                      final bool isAdmin = message.sender == widget.adminId;
                      final senderName = isCurrentUser
                          ? 'You'
                          : (isAdmin ? 'Admin' : message.sender);

                      return Align(
                        alignment: isCurrentUser
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 10.0),
                          decoration: BoxDecoration(
                            color: isCurrentUser ? Colors.green : Colors.blue,
                            borderRadius: BorderRadius.only(
                              topRight: isCurrentUser
                                  ? const Radius.circular(15)
                                  : Radius.zero,
                              topLeft: isAdmin
                                  ? const Radius.circular(15)
                                  : Radius.zero,
                              bottomRight: isCurrentUser
                                  ? Radius.zero
                                  : const Radius.circular(15),
                              bottomLeft: isAdmin
                                  ? Radius.zero
                                  : const Radius.circular(15),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '$senderName: ${message.message}',
                              style: const TextStyle(color: Colors.white),
                              overflow: TextOverflow.visible,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }

                return const CircularProgressIndicator();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                labelText: 'Enter Message',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    _sendMessage(
                        _textEditingController.text.trim(), widget.userId);
                    _textEditingController.clear();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage(String message, String userId) async {
    if (message.isNotEmpty) {
      await messagesCollection.doc(chatRoomId).collection('messages').add({
        'sender': userId,
        'receiver': widget.adminId,
        'message': message,
        'timestamp': DateTime.now(),
      });
    }
  }
}

class ChatMessage {
  final String sender;
  final String message;

  ChatMessage({required this.sender, required this.message});
}
