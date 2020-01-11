import 'package:angular/angular.dart';
import 'package:angular_bloc/angular_bloc.dart';
import 'package:angular_router/angular_router.dart';
import 'package:flutter_by_example/src/app/blocs/post_configuration_bloc/page_configuration_state.dart';

@Component(
  selector: 'post-header',
  templateUrl: 'post_header_component.html',
  styleUrls: ['post_header_component.css'],
  directives: [NgIf, routerDirectives],
  providers: [],
  pipes: [BlocPipe, commonPipes],
)
class PostHeaderComponent implements OnInit {
  final Router _router;

  PostHeaderComponent(this._router);

  bool get contentLoaded => (state is PageConfigurationBlocStateLoaded);

  @Input()
  PageConfigurationBlocState state;

  @override
  void ngOnInit() {}

  void navigateToHome() {
    _router.navigate('/');
  }
}
