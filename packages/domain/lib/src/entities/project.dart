import 'package:equatable/equatable.dart';

class Project extends Equatable {
  const Project({
    required this.title,
    required this.category,
    required this.description,
    required this.tags,
    required this.accentHex,
  });

  final String title;
  final String category;
  final String description;
  final List<String> tags;
  final String accentHex;

  @override
  List<Object?> get props => [title, category, description, tags, accentHex];
}
