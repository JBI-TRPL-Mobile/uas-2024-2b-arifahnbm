import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.purple[200],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        children: [
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.grey[300],
                  child: Icon(Icons.person, size: 70, color: Colors.white),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
          _buildCardWithTitle(
            title: 'Video preference',
            children: [
              _buildListTile(context, title: 'Download Option', onTap: () {}),
              _buildDivider(),
              _buildListTile(context,
                  title: 'Video playback option', onTap: () {}),
            ],
          ),
          SizedBox(height: 16),
          _buildCardWithTitle(
            title: 'Account Settings',
            children: [
              _buildListTile(context, title: 'Account Security', onTap: () {}),
              _buildDivider(),
              _buildListTile(context,
                  title: 'Email Notification Preferences', onTap: () {}),
              _buildDivider(),
              _buildListTile(context,
                  title: 'Learning Reminders', onTap: () {}),
            ],
          ),
          SizedBox(height: 16),
          _buildCardWithTitle(
            title: 'About Learnout',
            children: [
              _buildListTile(context, title: 'About Learnout', onTap: () {}),
              _buildDivider(),
              _buildListTile(context,
                  title: 'Frequently Asked Questions', onTap: () {}),
              _buildDivider(),
              _buildListTile(context,
                  title: 'Share the Learnout App', onTap: () {}),
            ],
          ),
          SizedBox(height: 32),
          Center(
            child: ElevatedButton(
              onPressed: () => _showLogoutDialog(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text('Log Out', style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardWithTitle(
      {required String title, required List<Widget> children}) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 18), // Judul tebal
              ),
            ),
            SizedBox(height: 8),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(BuildContext context,
      {required String title, required VoidCallback onTap}) {
    return ListTile(
      title: Text(title,
          style: TextStyle(color: Colors.black87)), // Teks list biasa
      trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
      onTap: onTap,
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 1,
      thickness: 1,
      indent: 16,
      endIndent: 16,
      color: Colors.grey[200],
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Log Out'),
          content: Text('Are you sure you want to log out?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
              },
              child: Text('No'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
                // Tambahkan logika logout di sini
                print('User logged out');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Text('Yes'),
            ),
          ],
        );
     },
);
}
}