import 'package:cat_api/data/models/cat/cat_model.dart';

abstract class CatRemoteData {
  Future<List<CatModel>> getCatModel({String? name});
}
