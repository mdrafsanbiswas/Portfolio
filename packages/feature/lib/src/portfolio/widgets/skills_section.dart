import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key, required this.skillGroups});

  final List<SkillGroup> skillGroups;

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Skills', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          ...skillGroups.map(
            (SkillGroup group) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    group.groupTitle,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: AppColors.blueAccent,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: group.skills
                        .map((String skill) => TagChip(label: skill))
                        .toList(growable: false),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
