import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BookReview extends StatelessWidget {
  const BookReview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance.collection('books').snapshots(),
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

        final documents = snapshot.data!.docs;

        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              for (final document in documents) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(document['author']),
                    Text(document['rating'].toString()),
                  ],
                ),
                Text(document['title']),
                SizedBox(height: 20),
              ],
            ],
          ),
        );
      },
    );
  }
}
