import 'package:cat_api/core/network/network_service.dart';
import 'package:cat_api/core/utils/logger.dart';
import 'package:cat_api/data/models/cat/cat_model.dart';
import 'package:cat_api/data/remote/cat/cat_remote_data.dart';

class RestCatRemote implements CatRemoteData {
  @override
  Future<List<CatModel>> getCatModel({String? name})async {
    final result = name == null
        ? await NetworkService.get(path: "")
        : await NetworkService.get(path: "search?q=$name");
    logger.i(result);
    final cat = ((result ?? []) as List).map((e) => CatModel.fromJson(e)).toList();
    return cat;
  }
}
