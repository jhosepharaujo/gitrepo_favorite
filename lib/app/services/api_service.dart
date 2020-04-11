import 'package:dio/dio.dart';
import 'package:gitrepo_favorite/app/shared/helpers/custom_dio.dart';
import 'package:gitrepo_favorite/app/shared/models/repository_model.dart';

class ApiService {
  final CustomDio _dio;
  ApiService(this._dio);

  Future<RepositoryModel> fetchData(String repository) async {
    try {
      final response = await this._dio.client.get(repository);
      //print(response.statusCode);
      return response.statusCode == 200
          ? RepositoryModel.fromJson(response.data)
          : null;
    } on DioError catch (e) {
      throw (e.message);
    }
  }
}
