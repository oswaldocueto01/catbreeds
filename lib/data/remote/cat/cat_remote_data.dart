import 'package:cat_api/data/models/cat/cat_model.dart';

//create a class abstract to have a contract or a preview
// of what cat_remote_data should receive
abstract class CatRemoteData {
  Future<List<CatModel>> getCatModel({String? name});
}
