import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:readbook/HomePage/home_page.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({
    super.key,
    required this.widget,
  });

  final HomePage widget;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('jesteś zalogowany jako ${widget.user.email}'),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();

              //   emailController.clear();
              // passwordController.clear();
            },
            child: Text('wyloguj'),
          ),
        ],
      ),
    );
  }
}
