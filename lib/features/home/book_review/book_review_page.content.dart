// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readbook/features/home/book_review/cubit/book_review_cubit.dart';

class BookReview extends StatelessWidget {
  const BookReview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookReviewCubit()..start(),
      child: BlocBuilder<BookReviewCubit, BookReviewState>(
        builder: (context, state) {
          state.documents;

          if (state.isLoading == true) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.errorMessage.isNotEmpty) {
            return Center(
              child: Text("something went wrong"),
            );
          }

          final documents = state.documents;

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
                      context
                          .read<BookReviewCubit>()
                          .deleteDocument(document.id);
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
      ),
    );
  }
}
