import 'package:flutter/material.dart';
import 'package:gitrepo_favorite/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gitrepo_favorite/app/shared/models/repository_model.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(RepositoryModelAdapter());
  await Hive.openBox('repositories');
  runApp(ModularApp(module: AppModule()));
}
