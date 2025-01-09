import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template_project/providers/user_provider.dart';
import '../widget/message_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Home - ${userProvider.currentUser?.name ?? "Unknown"}'),
        actions: [
          IconButton(
              onPressed: () {
                userProvider.signOut();
                Navigator.pop(context);
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: FutureBuilder(
          future: userProvider.loadMessages(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
                itemCount: userProvider.messages.length,
                itemBuilder: (context, index) {
                  final msg = UserProvider().messages[index];
                  return MessageItem(message: msg);
                });
          }),
    );
  }
}
