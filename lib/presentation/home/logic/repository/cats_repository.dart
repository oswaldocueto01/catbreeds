import 'package:cat_api/core/network/network_service.dart';
import 'package:cat_api/core/utils/logger.dart';
import 'package:cat_api/models/cats_model.dart';

class CatsRepository {
  static Future<List<CatsModel>> getCats({String? name}) async {
    try {
      final result = name == null
          ? await NetworkService.get(path: "")
          : await NetworkService.get(path: "search?q=$name");
      // logger.w(result);
      final cat =
          ((result ?? []) as List).map((e) => CatsModel.fromJson(e)).toList();
      return cat;
    } catch (e) {
      logger.i(e);
      return Future.error(e);
    }
  }
}
