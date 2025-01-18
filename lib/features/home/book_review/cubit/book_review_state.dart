part of 'book_review_cubit.dart';

@immutable
class BookReviewState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents;
  final bool isLoading;
  final String errorMessage;

  const BookReviewState({
    required this.documents,
    required this.isLoading,
    required this.errorMessage,
  });
}
