import 'package:angular/angular.dart';
import 'package:flutter_by_example/app_component.template.dart' as ng;
import 'package:flutter_by_example/src/app/repositories/repositories.dart';
import 'main.template.dart' as mainGenerated;
import 'package:bloc/bloc.dart';
import 'package:angular_router/angular_router.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
//    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
//    print(transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
//    print(error);
  }
}

FilesystemBrowserPostsRepository _repo;
FilesystemBrowserPostsRepository repoFactory() => _repo;

@GenerateInjector([
  routerProvidersHash,
  FactoryProvider(FilesystemBrowserPostsRepository, repoFactory),
])
final InjectorFactory appInjector = mainGenerated.appInjector$Injector;

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(ng.AppComponentNgFactory, createInjector: appInjector);
}
