import 'package:cat_api/core/network/network_service.dart';
import 'package:cat_api/data/remote/cat/cat_remote_data.dart';
import 'package:cat_api/data/remote/cat/rest_cat_remote.dart';
import 'package:cat_api/data/repositories/cat/cat_repository_data.dart';
import 'package:cat_api/domain/repositories/cat/cat_repository_domain.dart';
import 'package:cat_api/domain/use_cases/cat/cat_use_case_domain.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///We create a provider of the type of
///CatRemoteData that returns RestCatRemote
final catDatasourceProvider = Provider<CatRemoteData>((ref) {
  return RestCatRemote(NetworkService());
});

///Inject the Cat Remote to the repository and returns the repository to us
final catRepositoryProvider = Provider<CatRepositoryDomain>((ref) {
  final datasource = ref.watch(catDatasourceProvider);
  final repository = CatRepositoryData(datasource);
  return repository;
});

///We inject the Provider repository to our use case
final catUseCaseProvider = Provider<CatUseCase>((ref) {
  final repository = ref.watch(catRepositoryProvider);
  return CatUseCase(repository);
});


