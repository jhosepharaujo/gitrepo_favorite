import 'package:dio/dio.dart';
import 'package:gitrepo_favorite/app/shared/helpers/consts.dart';

class CustomDio {

  final Dio client;

  CustomDio(this.client) {
    this.client.options.baseUrl = Consts.BASE_URL;
  }
}