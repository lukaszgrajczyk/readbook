import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class BookReview extends StatelessWidget {
  const BookReview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('books')
          .orderBy('rating', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Center(
            child: Text("something went wrong"),
          );
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(
            child: Text('Brak danych'),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text('Loading');
        }

        final documents = snapshot.data!.docs;

        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            children: [
              for (final document in documents) ...[
                Dismissible(
                  key: ValueKey(document.id),
                  direction: DismissDirection.horizontal,
                  background: Container(
                    color: const Color.fromARGB(255, 245, 3, 3),
                    height: 60,
                    child: Text(
                      'DELETE',
                      textAlign: TextAlign.right,
                    ),
                  ),
                  onDismissed: (direction) {
                    FirebaseFirestore.instance
                        .collection('books')
                        .doc(document.id)
                        .delete();
                  },
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(document['author']),
                          Text(document['rating'].toString()),
                        ],
                      ),
                      Row(
                        children: [
                          Text(document['title']),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
              ],
            ],
          ),
        );
      },
    );
  }
}
