import 'package:equatable/equatable.dart';

class StatItem extends Equatable {
  const StatItem({required this.label, required this.value});

  final String label;
  final String value;

  @override
  List<Object?> get props => [label, value];
}
