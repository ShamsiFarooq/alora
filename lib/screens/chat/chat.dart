import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _messageController = TextEditingController();
  String? _userName;

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _saveUserName() {
    // Save the user name to the database
    FirebaseFirestore.instance
        .collection('user')
        .doc()
        .set({'name': _userName});
  }

  void _sendMessage() {
    String messageText = _messageController.text.trim();
    if (messageText.isNotEmpty) {
      // Save the message to the database
      FirebaseFirestore.instance.collection('messages').add({
        'sender': _userName,
        'text': messageText,
        'timestamp': DateTime.now(),
      });
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Chat'),
      ),
      body: Column(
        children: [
          SizedBox(height: 16.0),
          Text('Please enter your name:'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              onChanged: (value) {
                _userName = value;
              },
            ),
          ),
          ElevatedButton(
            onPressed: _saveUserName,
            child: Text('Save Name'),
          ),
          SizedBox(height: 16.0),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('messages')
                  .orderBy('timestamp')
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                List<DocumentSnapshot> messages = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    Map<String, dynamic>? data =
                        messages[index].data() as Map<String, dynamic>?;
                    String sender = data != null ? data['sender'] ?? '' : '';
                    String text = data != null ? data['text'] ?? '' : '';

                    return ListTile(
                      title: Text(sender),
                      subtitle: Text(text),
                    );
                  },
                );
              },
            ),
          ),
          SizedBox(height: 16.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Enter your message...',
                    ),
                  ),
                ),
                IconButton(
                  onPressed: _sendMessage,
                  icon: Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
