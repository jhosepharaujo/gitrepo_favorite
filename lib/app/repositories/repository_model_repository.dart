import 'package:gitrepo_favorite/app/Services/api_service.dart';
import 'package:gitrepo_favorite/app/shared/models/repository_model.dart';
import 'package:hive/hive.dart';

class RepositoryModelRepository {
  final ApiService apiService;
  var _database;

  RepositoryModelRepository(this.apiService){
    _database = Hive.box('repositories');
  }

  Future<bool> create(String repositoryName) async {
    try {
      final RepositoryModel model = await apiService.fetchData(repositoryName);
      this._database.add(model);
      return true;
    } catch (e) {
      throw (e.toString());
    }
  }
}
