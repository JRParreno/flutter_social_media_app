import 'package:equatable/equatable.dart';

class PostItemModel extends Equatable {
  final String firstName;
  final String lastName;
  final String postImageUrl;
  final String profileUrl;
  final int likeCount;
  final int commentCount;
  final int bookmarkCount;
  final String? location;

  const PostItemModel({
    required this.firstName,
    required this.lastName,
    required this.postImageUrl,
    required this.profileUrl,
    required this.likeCount,
    required this.commentCount,
    required this.bookmarkCount,
    this.location,
  });

  factory PostItemModel.fromJson(Map<String, dynamic> json) {
    return PostItemModel(
      firstName: json['firstName'],
      lastName: json['lastName'],
      profileUrl: json['profileUrl'],
      postImageUrl: json['postImageUrl'],
      likeCount: json['likeCount'],
      commentCount: json['commentCount'],
      bookmarkCount: json['bookmarkCount'],
    );
  }

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        postImageUrl,
        profileUrl,
        likeCount,
        commentCount,
        bookmarkCount,
        location,
      ];
}
