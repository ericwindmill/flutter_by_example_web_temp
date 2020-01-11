import 'dart:convert';
import 'package:flutter_by_example/src/app/models/models.dart';
import 'package:flutter_by_example/src/app/repositories/posts_repository_base.dart';
import 'package:http/http.dart';

class FilesystemBrowserPostsRepository extends PostRepository {
  Client client;

  FilesystemBrowserPostsRepository() {
    client = Client();
  }

  @override
  Future<List<PostConfiguration>> loadAllPosts() async {
    return [];
  }

  @override
  Future<PostConfiguration> loadMarkdownPostByPageId(String pageId) async {
    try {
      final reqUrl = 'http://localhost:8888/posts/$pageId.md';
      final response = await client.get(reqUrl);
      final body = response.body;
      var post = await PostConfiguration.fromJson(json.decode(body));
      return post;
    } catch (e, s) {
      print(e);
      print(s);
    }
    return null;
  }

  @override
  Future<List<PostCategory>> loadTableOfContents() async {
    var allPosts = [];
    try {
      var reqUrl = 'http://localhost:8888/';
      var response = await client.get(reqUrl);
      var body = response.body;
      List postsByCategory = json.decode(body);
      allPosts = postsByCategory.map((dynamic posts) => PostCategory.fromJson(posts)).toList();
      return allPosts;
    } catch (e) {
      print('Respoitory.LoadAllPostsByCategory.error: $e');
    }
    return allPosts;
  }
}
