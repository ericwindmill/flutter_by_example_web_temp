import 'package:angular/angular.dart';
import 'package:angular_bloc/angular_bloc.dart';
import 'package:flutter_by_example/src/app/models/models.dart';

import 'sub_category_post_list_component.dart';

@Component(
  selector: 'category-post-list',
  templateUrl: 'category_post_list_component.html',
  styleUrls: ['category_post_list_component.css'],
  directives: [
    NgIf,
    NgFor,
    SubCategoryPostListComponent,
  ],
  providers: [],
  pipes: [BlocPipe],
)
class CategoryPostListComponent {
  bool get contentLoaded => subCategories?.isNotEmpty;

  @Input()
  List<PostSubCategory> subCategories;

  CategoryPostListComponent();
}
