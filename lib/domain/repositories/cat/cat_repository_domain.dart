import '../../entities/cat/cat_entity.dart';

abstract class CatRepositoryDomain {
  Future<List<CatEntity>> getCatEntity({String? name});
}
