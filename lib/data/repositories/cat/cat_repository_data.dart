import 'package:cat_api/data/models/cat/cat_model.dart';
import 'package:cat_api/data/remote/cat/cat_remote_data.dart';
import 'package:cat_api/domain/entities/cat/cat_entity.dart';
import 'package:cat_api/domain/repositories/cat/cat_repository_domain.dart';

//We implement CatRepositoryDomain which will be the
// contract we have or the methods we should have
class CatRepositoryData implements CatRepositoryDomain {
  final CatRemoteData _catRemoteData;

  CatRepositoryData(this._catRemoteData);

  //
  @override
  Future<List<CatEntity>> getCatEntity({String? name}) async {
    final data = await _catRemoteData.getCatModel(name: name);
    //We're going to map the catModel list and return a new list in it,
    // but from toCatEntity which would be our catEntity intent
    final cat = data.map((e) => e.toCatEntity()).toList();
    return cat;
  }
}
