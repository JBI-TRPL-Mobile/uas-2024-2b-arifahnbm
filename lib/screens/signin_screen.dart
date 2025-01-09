import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void handleSignIn() {
    String email = emailController.text;
    String password = passwordController.text;

    // Lakukan validasi dan proses login di sini
    if (email.isNotEmpty && password.isNotEmpty) {
      Navigator.pushNamed(context, '/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter email and password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign In')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person, size: 100, color: Color.fromARGB(255, 152, 187, 244)),
            SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: handleSignIn,
              child: Text('Sign In'),
            ),
            SizedBox(height: 20),
              // Atau Sign In dengan
              Text(
                "or sign in with",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              SizedBox(height: 10),
              // Tombol Sign In dengan Google dan Facebook
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      // Aksi untuk Google Sign In
                      print("Google Sign In clicked");
                    },
                    icon: Icon(Icons.g_mobiledata, size: 40),
                  ),
                  SizedBox(width: 20),
                  IconButton(
                    onPressed: () {
                      // Aksi untuk Facebook Sign In
                      print("Facebook Sign In clicked");
                    },
                    icon: Icon(Icons.facebook, size: 40),
                  ),
                ],
              ),

            SizedBox(height: 16),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              child: Text('Don’t have an account? Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
