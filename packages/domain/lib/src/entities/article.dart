import 'package:equatable/equatable.dart';

class Article extends Equatable {
  const Article({
    required this.title,
    required this.summary,
    required this.publishedDate,
    required this.readTime,
  });

  final String title;
  final String summary;
  final String publishedDate;
  final String readTime;

  @override
  List<Object?> get props => [title, summary, publishedDate, readTime];
}
