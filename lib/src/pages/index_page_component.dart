import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

import 'package:angular_bloc/angular_bloc.dart';
import 'package:angular_router/angular_router.dart';
import 'package:flutter_by_example/src/app/blocs/table_of_contents_bloc/bloc.dart';
import 'package:flutter_by_example/src/app/blocs/table_of_contents_bloc/table_of_contents_bloc.dart';
import 'package:flutter_by_example/src/app/repositories/posts_respository_filesystem.dart';
import 'package:flutter_by_example/src/components/site_header_component.dart';
import 'package:flutter_by_example/src/components/table_of_contents_component.dart';

@Component(
  selector: 'index-page',
  templateUrl: 'index_page_component.html',
  styleUrls: [
    'package:angular_components/app_layout/layout.scss.css',
    'index_page_component.css'
  ],
  directives: [
    TableOfContentsComponent,
    MaterialButtonComponent,
    MaterialIconComponent,
    SiteHeaderComponent,
  ],
  providers: [FilesystemBrowserPostsRepository],
  pipes: [BlocPipe],
)
class IndexPageComponent implements OnActivate, OnDestroy {
  TableOfContentsBloc tocBloc;
  final FilesystemBrowserPostsRepository _postsRepository;

  IndexPageComponent(this._postsRepository);

  @override
  void onActivate(_, RouterState current) async {
    tocBloc = TableOfContentsBloc(repository: _postsRepository);
    await tocBloc.dispatch(LoadTableOfContents());
  }

  @override
  void ngOnDestroy() {
    tocBloc.dispose();
  }
}
