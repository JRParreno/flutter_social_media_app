part of 'story_bloc.dart';

abstract class StoryEvent extends Equatable {
  const StoryEvent();

  @override
  List<Object> get props => [];
}

class StoryLoadFixture extends StoryEvent {}

class StoryErrorLoad extends StoryEvent {}
