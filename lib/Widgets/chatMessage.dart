
import 'package:flutter/material.dart';

enum MessageStatus { sent, received, read }

class Message {
  final String text;
  final bool isMe;
  final MessageStatus status;
  final DateTime sendTime;

  Message({required this.text, required this.isMe, required this.status, required this.sendTime});
}

class ChatMessage extends StatelessWidget {
  final Message message;

  const ChatMessage({Key? key, required this.message}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final currentDate = DateTime.now();
    final isToday = message.sendTime.year == currentDate.year &&
        message.sendTime.month == currentDate.month &&
        message.sendTime.day == currentDate.day;

    final yesterday = currentDate.subtract(const Duration(days: 1));
    final isYesterday = message.sendTime.year == yesterday.year &&
        message.sendTime.month == yesterday.month &&
        message.sendTime.day == yesterday.day;

    String formattedDate;

    if (isToday) {
      formattedDate = 'Today';
    } else if(isYesterday) {
      formattedDate = 'Yesterday';
    } else {
      formattedDate = '${message.sendTime.day}/${message.sendTime.month}/${message.sendTime.year}';
    }
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment:
        message.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 5.0,right: 10),
                decoration:
                BoxDecoration(
                  color: message.isMe ? Colors.deepPurpleAccent : Colors.grey[200],
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(10.0),
                    topRight: const Radius.circular(10.0),
                    bottomLeft: message.isMe ? const Radius.circular(10.0) : const Radius.circular(0.0),
                    bottomRight: message.isMe ? const Radius.circular(0.0) : const Radius.circular(10.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    message.text,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: message.isMe ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 4.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    Text(
                      '${message.sendTime.hour}:${message.sendTime.minute}', // Display send time
                      style: TextStyle(
                        fontSize: 12.0,
                        color: message.isMe ? Colors.grey : Colors.black,
                      ),
                    ),
                    const SizedBox(width: 5.0),
                    _buildMessageStatus(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  formattedDate,
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey,
                  ),),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMessageStatus() {
    switch (message.status) {
      case MessageStatus.sent:
        return const Text('✓', style: TextStyle(fontSize: 12.0, color: Colors.grey));
      case MessageStatus.received:
        return const Text('✓✓', style: TextStyle(fontSize: 12.0, color: Colors.blue));
      case MessageStatus.read:
        return const Text('✓✓✓', style: TextStyle(fontSize: 12.0, color: Colors.green));
    }
  }
}