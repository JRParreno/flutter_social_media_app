part of 'story_bloc.dart';

abstract class StoryState extends Equatable {
  const StoryState();

  @override
  List<Object> get props => [];
}

class StoryLoading extends StoryState {}

class StoryLoaded extends StoryState {
  final List<StoryItemModel> stories;

  const StoryLoaded({required this.stories});

  @override
  List<Object> get props => [stories];
}

class StoryErrorLoaded extends StoryState {}
