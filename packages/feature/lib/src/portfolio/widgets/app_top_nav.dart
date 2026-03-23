import 'package:core/core.dart';
import 'package:flutter/material.dart';

class AppTopNav extends StatelessWidget {
  const AppTopNav({super.key, required this.title, required this.items});

  final String title;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final isCompact = constraints.maxWidth < ResponsiveBreakpoints.tablet;

        return SectionCard(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              if (isCompact)
                const Icon(Icons.menu_rounded, color: AppColors.textSecondary)
              else
                Wrap(
                  spacing: 20,
                  children: items
                      .map(
                        (String item) => Text(
                          item,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColors.textSecondary,
                              ),
                        ),
                      )
                      .toList(growable: false),
                ),
            ],
          ),
        );
      },
    );
  }
}
