import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_by_example/src/app/blocs/post_configuration_bloc/page_configuration_event.dart';
import 'package:flutter_by_example/src/app/blocs/post_configuration_bloc/page_configuration_state.dart';
import 'package:flutter_by_example/src/app/models/models.dart';
import 'package:flutter_by_example/src/app/repositories/posts_repository_base.dart';


class PageConfigurationBloc
    extends Bloc<PageConfigurationBlocEvent, PageConfigurationBlocState> {
  final PostRepository repository;

  PageConfigurationBloc({this.repository});

  @override
  PageConfigurationBlocState get initialState =>
      InitialPageConfigurationBlocState(
        PostConfiguration(
            id: 'post_one',
            frontmatter: PostFrontmatter(title: 'PostOne', author: 'Eric'),
            content: '# test post \n # yeeeet'),
      );

  @override
  Stream<PageConfigurationBlocState> mapEventToState(
    PageConfigurationBlocEvent event,
  ) async* {
    if (event is LoadSinglePage) {
      var postConfig = await repository.loadMarkdownPostByPageId(event.postId);
      yield new PageConfigurationBlocStateLoaded(postConfig);
    }
  }
}
