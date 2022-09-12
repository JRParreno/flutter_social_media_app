import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:social_media_app/src/common/story/story_item_model.dart';

import '../../../core/fixture_reader.dart';

part 'story_event.dart';
part 'story_state.dart';

class StoryBloc extends Bloc<StoryEvent, StoryState> {
  StoryBloc() : super(StoryLoading()) {
    on<StoryLoadFixture>(_onStoryLoadFixture);
    on<StoryErrorLoad>(_onStoryErrorLoad);
  }

  void _onStoryLoadFixture(
    StoryLoadFixture event,
    Emitter<StoryState> emit,
  ) async {
    try {
      final jasonData = await fixture('fixtures/stories.json');
      final jsonMap = json.decode(jasonData) as Map<String, dynamic>;
      final list = jsonMap['stories'] as List<dynamic>;
      emit(
        StoryLoaded(
          stories: list.map((e) => StoryItemModel.fromJson(e)).toList(),
        ),
      );
    } on FileSystemException {
      emit(StoryErrorLoaded());
    }
  }

  void _onStoryErrorLoad(StoryErrorLoad event, Emitter<StoryState> emit) {}
}
