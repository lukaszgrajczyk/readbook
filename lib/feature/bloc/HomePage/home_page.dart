import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:readbook/feature/bloc/AddBookReview/add_review_page_content.dart';
import 'package:readbook/feature/bloc/BookReview/book_review_page.content.dart';
import 'package:readbook/feature/bloc/MyAccount/my_account_page_content.dart';

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
          return BookReview();
        }
        return Builder(builder: (context) {
          if (currentIndex == 1) {
            return AddBookReview(
              onSave: () {
                setState(
                  () {
                    currentIndex = 0;
                  },
                );
              },
            );
          }
          return Builder(builder: (context) {
            return MyAccount(email: widget.user.email);
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
