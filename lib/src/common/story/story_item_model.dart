import 'package:equatable/equatable.dart';

class StoryItemModel extends Equatable {
  final String firstName;
  final String lastName;
  final String imageUrl;
  final String profileUrl;

  const StoryItemModel({
    required this.firstName,
    required this.lastName,
    required this.imageUrl,
    required this.profileUrl,
  });

  factory StoryItemModel.fromJson(Map<String, dynamic> json) {
    return StoryItemModel(
      firstName: json['firstName'],
      imageUrl: json['imageUrl'],
      lastName: json['lastName'],
      profileUrl: json['profileUrl'],
    );
  }

  @override
  List<Object?> get props => [firstName, lastName, imageUrl, profileUrl];
}
