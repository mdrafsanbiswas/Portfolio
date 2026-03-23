import 'package:equatable/equatable.dart';

import 'article.dart';
import 'experience.dart';
import 'profile.dart';
import 'project.dart';
import 'skill_group.dart';
import 'social_link.dart';
import 'stat_item.dart';

class PortfolioContent extends Equatable {
  const PortfolioContent({
    required this.profile,
    required this.stats,
    required this.experiences,
    required this.projects,
    required this.articles,
    required this.skillGroups,
    required this.socialLinks,
  });

  final Profile profile;
  final List<StatItem> stats;
  final List<Experience> experiences;
  final List<Project> projects;
  final List<Article> articles;
  final List<SkillGroup> skillGroups;
  final List<SocialLink> socialLinks;

  @override
  List<Object?> get props => [
    profile,
    stats,
    experiences,
    projects,
    articles,
    skillGroups,
    socialLinks,
  ];
}
