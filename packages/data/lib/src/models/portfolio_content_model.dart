import 'package:domain/domain.dart';

class PortfolioContentModel {
  const PortfolioContentModel({
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

  factory PortfolioContentModel.fromJson(Map<String, dynamic> json) {
    final profileData = json['profile'] as Map<String, dynamic>;

    return PortfolioContentModel(
      profile: Profile(
        name: profileData['name'] as String,
        role: profileData['role'] as String,
        shortBio: profileData['shortBio'] as String,
        longBio: profileData['longBio'] as String,
        location: profileData['location'] as String,
        email: profileData['email'] as String,
        availability: profileData['availability'] as String,
        ctaLabel: profileData['ctaLabel'] as String,
      ),
      stats: (json['stats'] as List<dynamic>)
          .map((dynamic item) => item as Map<String, dynamic>)
          .map(
            (Map<String, dynamic> item) => StatItem(
              label: item['label'] as String,
              value: item['value'] as String,
            ),
          )
          .toList(growable: false),
      experiences: (json['experiences'] as List<dynamic>)
          .map((dynamic item) => item as Map<String, dynamic>)
          .map(
            (Map<String, dynamic> item) => Experience(
              role: item['role'] as String,
              company: item['company'] as String,
              period: item['period'] as String,
              description: item['description'] as String,
              highlights: (item['highlights'] as List<dynamic>)
                  .cast<String>()
                  .toList(growable: false),
            ),
          )
          .toList(growable: false),
      projects: (json['projects'] as List<dynamic>)
          .map((dynamic item) => item as Map<String, dynamic>)
          .map(
            (Map<String, dynamic> item) => Project(
              title: item['title'] as String,
              category: item['category'] as String,
              description: item['description'] as String,
              tags: (item['tags'] as List<dynamic>).cast<String>().toList(
                growable: false,
              ),
              accentHex: item['accentHex'] as String,
            ),
          )
          .toList(growable: false),
      articles: (json['articles'] as List<dynamic>)
          .map((dynamic item) => item as Map<String, dynamic>)
          .map(
            (Map<String, dynamic> item) => Article(
              title: item['title'] as String,
              summary: item['summary'] as String,
              publishedDate: item['publishedDate'] as String,
              readTime: item['readTime'] as String,
            ),
          )
          .toList(growable: false),
      skillGroups: (json['skillGroups'] as List<dynamic>)
          .map((dynamic item) => item as Map<String, dynamic>)
          .map(
            (Map<String, dynamic> item) => SkillGroup(
              groupTitle: item['groupTitle'] as String,
              skills: (item['skills'] as List<dynamic>).cast<String>().toList(
                growable: false,
              ),
            ),
          )
          .toList(growable: false),
      socialLinks: (json['socialLinks'] as List<dynamic>)
          .map((dynamic item) => item as Map<String, dynamic>)
          .map(
            (Map<String, dynamic> item) => SocialLink(
              label: item['label'] as String,
              url: item['url'] as String,
              icon: item['icon'] as String,
            ),
          )
          .toList(growable: false),
    );
  }

  PortfolioContent toEntity() {
    return PortfolioContent(
      profile: profile,
      stats: stats,
      experiences: experiences,
      projects: projects,
      articles: articles,
      skillGroups: skillGroups,
      socialLinks: socialLinks,
    );
  }
}
