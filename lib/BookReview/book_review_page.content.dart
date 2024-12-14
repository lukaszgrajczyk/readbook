import 'package:flutter/material.dart';

class BookReview extends StatelessWidget {
  const BookReview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Przejrzyj opinie'),
        ],
      ),
    );
  }
}
