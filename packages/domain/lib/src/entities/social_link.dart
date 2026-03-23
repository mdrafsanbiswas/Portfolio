import 'package:equatable/equatable.dart';

class SocialLink extends Equatable {
  const SocialLink({
    required this.label,
    required this.url,
    required this.icon,
  });

  final String label;
  final String url;
  final String icon;

  @override
  List<Object?> get props => [label, url, icon];
}
