import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_screen.dart';
import 'sign_up_screen.dart';
import '../providers/user_provider.dart';

class SignInScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign In')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await context.read<UserProvider>().loadUsers();
                context.read<UserProvider>().signIn(_nameController.text);
                if (context.read<UserProvider>().currentUser != null && context.read<UserProvider>().currentUser!.id != -1) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('User not found')));
                }
              },
              child: Text('Sign In'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()),
                );
              },
              child: Text('Don\'t have an account? Sign Up'),
            )
          ],
        ),
      ),
    );
  }
}