import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:readbook/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.user,
  });

  final User user;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        if (currentIndex == 0) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('hej'),
              ],
            ),
          );
        }
        return Builder(builder: (context) {
          if (currentIndex == 1) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('hej 2'),
                ],
              ),
            );
          }
          return Builder(builder: (context) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('jesteś zalogowany jako ${widget.user.email}'),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();

                      emailController.clear();
                      passwordController.clear();
                    },
                    child: Text('wyloguj'),
                  ),
                ],
              ),
            );
          });
        });
      }),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (newIndex) {
            setState(() {
              currentIndex = newIndex;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.recent_actors_outlined),
              label: 'opinia',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_reaction),
              label: 'dodaj opinie',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box_outlined),
              label: 'konto',
            ),
          ]),
    );
  }
}
