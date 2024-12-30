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
}
