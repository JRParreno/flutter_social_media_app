import 'package:social_media_app/src/models/user.dart';

class Profile extends User {
  final String intro;
  final String followers;
  final String following;
  final String backgroundUrl;

  const Profile({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.profileUrl,
    required this.intro,
    required this.followers,
    required this.following,
    required this.backgroundUrl,
  });

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        profileUrl,
        intro,
        followers,
        following,
        backgroundUrl,
      ];
}
