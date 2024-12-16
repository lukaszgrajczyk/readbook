import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({super.key, required this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('jesteś zalogowany jako $email'),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
            child: Text('wyloguj'),
          ),
        ],
      ),
    );
  }
}
