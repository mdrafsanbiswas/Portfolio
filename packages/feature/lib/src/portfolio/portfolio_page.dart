import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import 'portfolio_controller.dart';
import 'widgets/app_top_nav.dart';
import 'widgets/articles_section.dart';
import 'widgets/contact_card.dart';
import 'widgets/experience_section.dart';
import 'widgets/hero_intro_card.dart';
import 'widgets/profile_overview_card.dart';
import 'widgets/projects_section.dart';
import 'widgets/skills_section.dart';
import 'widgets/socials_row.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key, required this.useCase});

  final GetPortfolioContentUseCase useCase;

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  late final PortfolioController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PortfolioController(useCase: widget.useCase)..load();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        if (_controller.isLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (_controller.error != null || _controller.content == null) {
          return Scaffold(
            body: Center(
              child: Text(
                _controller.error ?? 'Unknown error',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          );
        }

        return _PortfolioView(content: _controller.content!);
      },
    );
  }
}

class _PortfolioView extends StatelessWidget {
  const _PortfolioView({required this.content});

  final PortfolioContent content;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final width = constraints.maxWidth;
        final isDesktop = width >= ResponsiveBreakpoints.desktop;
        final isTablet = width >= ResponsiveBreakpoints.tablet && !isDesktop;

        final horizontalPadding = isDesktop
            ? 52.0
            : isTablet
            ? 28.0
            : 16.0;

        return Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1240),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding,
                    vertical: 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTopNav(
                        title: 'Personal Portfolio',
                        items: const ['About', 'Work', 'Articles', 'Contact'],
                      ),
                      const SizedBox(height: 24),
                      if (isDesktop)
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 7,
                              child: HeroIntroCard(profile: content.profile),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              flex: 3,
                              child: ProfileOverviewCard(
                                profile: content.profile,
                                stats: content.stats,
                              ),
                            ),
                          ],
                        )
                      else ...[
                        HeroIntroCard(profile: content.profile),
                        const SizedBox(height: 16),
                        ProfileOverviewCard(
                          profile: content.profile,
                          stats: content.stats,
                        ),
                      ],
                      const SizedBox(height: 20),
                      if (isDesktop)
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 7,
                              child: Column(
                                children: [
                                  ExperienceSection(
                                    experiences: content.experiences,
                                  ),
                                  const SizedBox(height: 16),
                                  ProjectsSection(projects: content.projects),
                                ],
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              flex: 3,
                              child: Column(
                                children: [
                                  SkillsSection(
                                    skillGroups: content.skillGroups,
                                  ),
                                  const SizedBox(height: 16),
                                  ArticlesSection(articles: content.articles),
                                  const SizedBox(height: 16),
                                  ContactCard(profile: content.profile),
                                ],
                              ),
                            ),
                          ],
                        )
                      else ...[
                        ExperienceSection(experiences: content.experiences),
                        const SizedBox(height: 16),
                        ProjectsSection(projects: content.projects),
                        const SizedBox(height: 16),
                        SkillsSection(skillGroups: content.skillGroups),
                        const SizedBox(height: 16),
                        ArticlesSection(articles: content.articles),
                        const SizedBox(height: 16),
                        ContactCard(profile: content.profile),
                      ],
                      const SizedBox(height: 24),
                      SocialsRow(links: content.socialLinks),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
