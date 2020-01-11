import 'package:flutter_by_example/src/app/models/models.dart';

abstract class PostRepository {
  Future<PostConfiguration> loadMarkdownPostByPageId(String pageId);
  Future<List<PostConfiguration>> loadAllPosts();
  Future<List<PostCategory>> loadTableOfContents();
}