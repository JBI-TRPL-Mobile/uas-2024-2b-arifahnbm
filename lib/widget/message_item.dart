import 'package:flutter/material.dart';
import 'package:template_project/models/message.dart';

class MessageItem extends StatelessWidget {
  final Message message;

  const MessageItem({required this.message});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(message.message),
      subtitle: Text('User ID: ${message.userId}'),
    );
  }
}
