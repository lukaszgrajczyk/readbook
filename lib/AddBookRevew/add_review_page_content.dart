import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddBookReview extends StatefulWidget {
  const AddBookReview({
    super.key,
    required this.onSave,
  });

  final Function() onSave;

  @override
  State<AddBookReview> createState() => _AddBookReviewState();
}

class _AddBookReviewState extends State<AddBookReview> {
  var bookTitle = '';
  var bookAuthor = '';
  double rating = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (newValue) {
                setState(
                  () {
                    bookAuthor = newValue;
                  },
                );
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person_add_alt_1_rounded),
                hintText: 'book Author',
                labelText: 'Add book Author',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              onChanged: (newValue) {
                setState(
                  () {
                    bookTitle = newValue;
                  },
                );
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.title_rounded),
                hintText: 'Book title',
                labelText: 'Add book title',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),
            Slider(
              value: rating,
              onChanged: (newRating) {
                setState(
                  () {
                    rating = newRating;
                  },
                );
              },
              label: rating.toString(),
              activeColor: Color.fromARGB(222, 37, 174, 216),
              inactiveColor: Color.fromARGB(222, 223, 185, 223),
              min: 0.0,
              max: 6.0,
              divisions: 6,
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () async {
                await FirebaseFirestore.instance.collection('books').add(
                  {
                    'author': bookAuthor,
                    'title': bookTitle,
                    'rating': rating,
                  },
                );
                widget.onSave();
              },
              child: Text('dodaj opinie'),
            )
          ],
        ),
      ),
    );
  }
}
