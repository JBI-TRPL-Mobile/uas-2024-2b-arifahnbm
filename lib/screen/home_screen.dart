import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'course.jpg',
            width: 250,
          ),
          SizedBox(height: 10),
          Text('Selamat Datang!!!', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          SizedBox(height: 10),
          Text('Silakan sign in untuk melanjutkan, dan sign up jika belum memiliki akun'),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/sign_in'),
                child: Text('Sign In'),
              ),
              SizedBox(width: 20,),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/sign_up'),
                child: Text('Sign Up'),
              )
            ],
          )
        ],
      
      )),
    );
  }
}
