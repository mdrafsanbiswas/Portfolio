import 'package:equatable/equatable.dart';

class SkillGroup extends Equatable {
  const SkillGroup({required this.groupTitle, required this.skills});

  final String groupTitle;
  final List<String> skills;

  @override
  List<Object?> get props => [groupTitle, skills];
}
