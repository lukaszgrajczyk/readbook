import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:meta/meta.dart';
part 'book_review_state.dart';

class BookReviewCubit extends Cubit<BookReviewState> {
  BookReviewCubit()
      : super(
          BookReviewState(
            documents: [],
            isLoading: false,
            errorMessage: '',
          ),
        );

  Future<void> start() async {
    emit(
      BookReviewState(
        documents: [],
        isLoading: true,
        errorMessage: '',
      ),
    );

    await Future.delayed(
      const Duration(seconds: 5),
    );

    emit(
      BookReviewState(
        documents: [],
        isLoading: false,
        errorMessage: '',
      ),
    );

    FirebaseFirestore.instance
        .collection('books')
        .orderBy('rating', descending: true)
        .snapshots()
        .listen(
      (data) {
        emit(
          BookReviewState(
            documents: data.docs,
            isLoading: false,
            errorMessage: '',
          ),
        );
      },
    );
  }
}
