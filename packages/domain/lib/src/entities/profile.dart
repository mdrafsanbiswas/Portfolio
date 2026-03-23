import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  const Profile({
    required this.name,
    required this.role,
    required this.shortBio,
    required this.longBio,
    required this.location,
    required this.email,
    required this.availability,
    required this.ctaLabel,
  });

  final String name;
  final String role;
  final String shortBio;
  final String longBio;
  final String location;
  final String email;
  final String availability;
  final String ctaLabel;

  @override
  List<Object?> get props => [
    name,
    role,
    shortBio,
    longBio,
    location,
    email,
    availability,
    ctaLabel,
  ];
}
