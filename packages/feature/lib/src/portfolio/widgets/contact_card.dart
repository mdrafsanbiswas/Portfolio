import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({super.key, required this.profile});

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      backgroundColor: AppColors.accentSoft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Contact', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(Icons.location_on_outlined, size: 18),
              const SizedBox(width: 8),
              Expanded(child: Text(profile.location)),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.mail_outline_rounded, size: 18),
              const SizedBox(width: 8),
              Expanded(child: Text(profile.email)),
            ],
          ),
          const SizedBox(height: 14),
          AppPrimaryButton(label: profile.ctaLabel, onPressed: () {}),
        ],
      ),
    );
  }
}
