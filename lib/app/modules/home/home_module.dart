import 'package:dio/dio.dart';
import 'package:gitrepo_favorite/app/Services/api_service.dart';
import 'package:gitrepo_favorite/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gitrepo_favorite/app/modules/home/home_page.dart';
import 'package:gitrepo_favorite/app/repositories/repository_model_repository.dart';
import 'package:gitrepo_favorite/app/shared/helpers/custom_dio.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => Dio()),
        Bind((i)=> CustomDio(i.get<Dio>())),
        Bind((i)=> ApiService(i.get<CustomDio>())),
        Bind((i)=> RepositoryModelRepository(i.get<ApiService>())),
        Bind((i) => HomeController(i.get<RepositoryModelRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
