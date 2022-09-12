import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:social_media_app/src/common/post/post_item_model.dart';

import '../../../core/fixture_reader.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostLoading()) {
    on<PostLoadFixture>(_onPostLoadFixture);
    on<PostErrorLoad>(_onPostErrorLoad);
  }

  void _onPostLoadFixture(
    PostLoadFixture event,
    Emitter<PostState> emit,
  ) async {
    try {
      final jasonData = await fixture('fixtures/posts.json');
      final jsonMap = json.decode(jasonData) as Map<String, dynamic>;
      final list = jsonMap['posts'] as List<dynamic>;
      emit(
        PostLoaded(
          posts: list.map((e) => PostItemModel.fromJson(e)).toList(),
        ),
      );
    } on FileSystemException {
      emit(PostErrorLoaded());
    }
  }

  void _onPostErrorLoad(PostErrorLoad event, Emitter<PostState> emit) {}
}
