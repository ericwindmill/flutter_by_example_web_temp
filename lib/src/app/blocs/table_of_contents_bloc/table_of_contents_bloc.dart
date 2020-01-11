import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_by_example/src/app/models/models.dart';
import 'package:flutter_by_example/src/app/repositories/posts_repository_base.dart';
import 'package:flutter_by_example/src/app/use_case/table_of_contents/sort_post.dart';

import './bloc.dart';

class TableOfContentsBloc extends Bloc<TableOfContentsEvent, TableOfContentsState> {
  final PostRepository repository;

  TableOfContentsBloc({this.repository});

  @override
  TableOfContentsState get initialState => InitialTableOfContentsState([]);

  @override
  Stream<TableOfContentsState> mapEventToState(
    TableOfContentsEvent event,
  ) async* {
    if (event is LoadTableOfContents) {
      List<PostCategory> allPosts = await repository.loadTableOfContents();
      List<PostCategory> sorted = sortPosts(allPosts);
      yield TableOfContentsLoadedState(sorted);
    }
  }
}
