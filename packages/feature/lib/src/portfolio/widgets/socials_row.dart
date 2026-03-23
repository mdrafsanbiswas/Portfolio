import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialsRow extends StatelessWidget {
  const SocialsRow({super.key, required this.links});

  final List<SocialLink> links;

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      child: Wrap(
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        spacing: 10,
        runSpacing: 10,
        children: links
            .map(
              (SocialLink link) => OutlinedButton.icon(
                onPressed: () => _open(link.url),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.textPrimary,
                  side: const BorderSide(color: AppColors.border),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                icon: Icon(_iconFor(link.icon), size: 18),
                label: Text(link.label),
              ),
            )
            .toList(growable: false),
      ),
    );
  }

  IconData _iconFor(String icon) {
    switch (icon) {
      case 'github':
        return Icons.code_rounded;
      case 'linkedin':
        return Icons.business_center_outlined;
      case 'x':
        return Icons.alternate_email_rounded;
      case 'dribbble':
      default:
        return Icons.sports_basketball_outlined;
    }
  }

  Future<void> _open(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
