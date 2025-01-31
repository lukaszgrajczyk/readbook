import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
part 'book_review_state.dart';

class BookReviewCubit extends Cubit<BookReviewState> {
  BookReviewCubit()
      : super(
          const BookReviewState(
            documents: [],
            isLoading: false,
            errorMessage: '',
          ),
        );

  StreamSubscription? _subscription;

  Future<void> start() async {
    emit(
      const BookReviewState(
        documents: [],
        isLoading: true,
        errorMessage: '',
      ),
    );

    emit(
      const BookReviewState(
        documents: [],
        isLoading: false,
        errorMessage: '',
      ),
    );

    _subscription = FirebaseFirestore.instance
        .collection('books')
        .orderBy('rating', descending: true)
        .snapshots()
        .listen((data) {
      emit(
        BookReviewState(
          documents: data.docs,
          isLoading: false,
          errorMessage: '',
        ),
      );
    }, onError: (error) {
      emit(BookReviewState(
        documents: const [],
        isLoading: false,
        errorMessage: error.toString(),
      ));
    });
  }

  void deleteDocument(String id) {
    FirebaseFirestore.instance.collection('books').doc(id).delete();
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    return super.close();
  }
}
