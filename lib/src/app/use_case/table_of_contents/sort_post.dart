import 'package:flutter_by_example/src/app/models/models.dart';
import 'package:flutter_by_example/src/app/table_of_contents.dart';

// TODO: optimize this if it's slow AF.
// This is very brute force and ugly.
// the loops should not be hitting each node multiple times
// ignore_for_file: omit_local_variable_types
List<PostCategory> sortPosts(List<PostCategory> allPosts) {
  try {
    /// these are used as temporary storage to sort portions
    /// of the final sort. They are often cleared
    List<PostCategory> sorted = [];
    List<PostSubCategory> sortedForCategory = [];
    List<PostFrontmatter> sortedForSubcategory = [];
    // Post category
    int categoryPartNumber = 1;
    List<String> sortedCategoryTitles = TABLE_OF_CONTENTS.keys.toList();
    sortedCategoryTitles.forEach((String categoryTitle) {
      // uncomment to debug front-matter errors
//      print("sort.categoryTitle loop :: $categoryTitle");
      PostCategory categoryObject = allPosts.firstWhere((c) {
        var categoryTitleFromObject = c.title.toLowerCase().trim();
        var categoryTitleFromToC = categoryTitle.toLowerCase().trim();
        return categoryTitleFromObject == categoryTitleFromToC;
      })
        ..order = categoryPartNumber;
      categoryPartNumber++;
      // subcategory
      List<String> sortedSubcategoryTitles = TABLE_OF_CONTENTS[categoryTitle].keys.toList();
      sortedSubcategoryTitles.forEach((String subcategoryTitle) {
        // uncomment to debug front-matter errors
//        print("sort.subcategoryTitle loop :: $subcategoryTitle");
        PostSubCategory postSubCategoryObject = categoryObject.subCategories.firstWhere((s) {
          var subcategoryTitleFromObject = s.title.toLowerCase().trim();
          var subcategoryTitleFromToC = subcategoryTitle.toLowerCase().trim();
          return subcategoryTitleFromToC == subcategoryTitleFromObject;
        });

        // posts
        List<String> sortedPostNames = TABLE_OF_CONTENTS[categoryTitle][subcategoryTitle].toList();
        sortedPostNames.forEach((String postTitle) {
//          print("sort.postName loop :: $postTitle");
          PostFrontmatter post = postSubCategoryObject.posts.firstWhere((p) {
            var postTitleFromObject = p.title.toLowerCase().trim();
            var postTitleFromToC = postTitle.toLowerCase().trim();
            return postTitleFromObject == postTitleFromToC;
          });
          sortedForSubcategory.add(post);
        });
        // now that posts are sorted for this particular subcategory,
        // update the original object and clear the temp storage
        postSubCategoryObject.posts = sortedForSubcategory.sublist(0);
        sortedForSubcategory.clear();

        sortedForCategory.add(postSubCategoryObject);
      });
      // now that [subcategories] are sorted for this particular subcategory,
      // update the original object and clear the temp storage
      categoryObject.subCategories = sortedForCategory.sublist(0);
      sorted.add(categoryObject);
      sortedForCategory.clear();
    });
    return sorted;
  } catch (e, s) {
    print(e);
    print(s);
  }
  return null;
}
