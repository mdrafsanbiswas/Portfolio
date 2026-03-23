import 'package:equatable/equatable.dart';

class Experience extends Equatable {
  const Experience({
    required this.role,
    required this.company,
    required this.period,
    required this.description,
    required this.highlights,
  });

  final String role;
  final String company;
  final String period;
  final String description;
  final List<String> highlights;

  @override
  List<Object?> get props => [role, company, period, description, highlights];
}
