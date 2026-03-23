import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class HeroIntroCard extends StatelessWidget {
  const HeroIntroCard({super.key, required this.profile});

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final isCompact = constraints.maxWidth < 720;

          if (isCompact) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _IntroBody(profile: profile),
                const SizedBox(height: 16),
                const _AvatarBubble(alignment: Alignment.centerLeft),
              ],
            );
          }

          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 7, child: _IntroBody(profile: profile)),
              const SizedBox(width: 16),
              const Expanded(
                flex: 3,
                child: _AvatarBubble(alignment: Alignment.center),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _IntroBody extends StatelessWidget {
  const _IntroBody({required this.profile});

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'HELLO I\'M',
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: AppColors.textMuted,
            letterSpacing: 1.1,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          profile.name,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            fontSize: 38,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          profile.role,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(color: AppColors.blueAccent),
        ),
        const SizedBox(height: 14),
        Text(profile.shortBio, style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: 18),
        AppPrimaryButton(label: profile.ctaLabel, onPressed: () {}),
      ],
    );
  }
}

class _AvatarBubble extends StatelessWidget {
  const _AvatarBubble({required this.alignment});

  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.border),
          gradient: const LinearGradient(
            colors: [Color(0xFFFFD7DD), Color(0xFFE7ECF8)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: const Icon(
          Icons.person_rounded,
          size: 62,
          color: AppColors.textSecondary,
        ),
      ),
    );
  }
}
