import 'package:flutter/material.dart';

class AddBookReview extends StatelessWidget {
  const AddBookReview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Dodaj opinie książki'),
        ],
      ),
    );
  }
}
