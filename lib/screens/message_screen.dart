import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                shape: BoxShape.rectangle,
              ),
            ),
            title: Text(
              'Nama Pengirim',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'Pesan contoh untuk menampilkan ringkasan pesan...',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            onTap: () {},
          );
        },
      ),
    );
  }
}