import 'package:flutter/material.dart';

class AddBookReview extends StatelessWidget {
  AddBookReview({
    super.key,
  });

  final bookTitle = TextEditingController();
  final bookAuthor = TextEditingController();
  final rating = 5.5;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: bookAuthor,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person_add_alt_1_rounded),
                hintText: 'book Author',
                labelText: 'Add book Author',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: bookTitle,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.title_rounded),
                hintText: 'Book title',
                labelText: 'Add book title',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),
            Text('"tu będzie slider"'),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                // final document = snapshot.data!.docs;
              },
              child: Text('dodaj opinie'),
            ),
          ],
        ),
      ),
    );
  }
}

//  await FirebaseFirestore.instance.collection('books').add(
//                   'author':bookAuthor,
//                   'title': bookTitle,
//                   'rating': rating