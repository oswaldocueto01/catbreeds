import 'package:cat_api/domain/repositories/cat/cat_repository_domain.dart';

import '../../entities/cat/cat_entity.dart';


class CatUseCase {

  final CatRepositoryDomain repository;

  CatUseCase(this.repository);

  Future<List<CatEntity>> getCats({String? name}) async {
    return repository.getCatEntity(name: name);
  }
}
