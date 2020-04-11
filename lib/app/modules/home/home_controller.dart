import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gitrepo_favorite/app/repositories/repository_model_repository.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final RepositoryModelRepository repository;
  _HomeControllerBase(this.repository);

  @observable
  int value = 0;

  @action
  Future<bool> create(repository) async {
    try {
      final model = await this.repository.create(repository);
      print(model);
      return true;
    } catch (e) {
      Get.snackbar(
        "Ops!", // title
        "Falha ao buscar repositório", // message
        icon: Icon(Icons.error_outline),
        shouldIconPulse: false,
        barBlur: 100,
        isDismissible: true,
        duration: Duration(seconds: 3),
      );
      return false;
    }
  }

// @action
// void fetchData(){}

  @action
  void increment() {
    value++;
  }
}
