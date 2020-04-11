import 'package:hive/hive.dart';

part 'repository_model.g.dart';

@HiveType(typeId: 1)
class RepositoryModel  extends HiveObject{
  @HiveField(0)
  int id;
  @HiveField(1)
  String nodeId;
  @HiveField(2)
  String name;
  @HiveField(3)
  String fullName;
  @HiveField(4)
  String htmlUrl;
  @HiveField(5)
  String description;
  @HiveField(6)
  int forks;
  @HiveField(7)
  int watchers;

  RepositoryModel(
      {this.id,
      this.nodeId,
      this.name,
      this.fullName,
      this.htmlUrl,
      this.description,
      this.forks,
      this.watchers});

  RepositoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nodeId = json['node_id'];
    name = json['name'];
    fullName = json['full_name'];
    htmlUrl = json['html_url'];
    description = json['description'];
    forks = json['forks'];
    watchers = json['watchers'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['node_id'] = this.nodeId;
    data['name'] = this.name;
    data['full_name'] = this.fullName;
    data['html_url'] = this.htmlUrl;
    data['description'] = this.description;
    data['forks'] = this.forks;
    data['watchers'] = this.watchers;
    return data;
  }
}
