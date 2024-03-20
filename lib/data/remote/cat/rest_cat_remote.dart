import 'package:cat_api/core/network/network_service.dart';
import 'package:cat_api/core/utils/logger.dart';
import 'package:cat_api/data/models/cat/cat_model.dart';
import 'package:cat_api/data/remote/cat/cat_remote_data.dart';

//We make the request regardless of
// whether it is from HTTP, Graphql or etc.
//We implement CatRemoteData to know what we should
// receive or return our Methods
class RestCatRemote implements CatRemoteData {
  final NetworkService _networkService;
  RestCatRemote(this._networkService);

//makes the request and returns a list with
//the result of this response of type List CatModel
  @override
  Future<List<CatModel>> getCatModel({String? name})async {
    //we make request and save the response in result
    // We make different requests if name is null, then we make a
    // normal request if we don't make a search request
    final result = name == null
        ? await _networkService.get(path: "")
        : await _networkService.get(path: "search?q=$name");
    logger.i(result);
    //we convert the result to a list of CatModel and return cats
    final cats = ((result ?? []) as List).map((e) => CatModel.fromJson(e)).toList();
    return cats;
  }
}
