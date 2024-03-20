// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:cat_api/core/network/network_service.dart';
import 'package:cat_api/data/remote/cat/rest_cat_remote.dart';
import 'package:cat_api/data/repositories/cat/cat_repository_data.dart';
import 'package:cat_api/domain/entities/cat/cat_entity.dart';
import 'package:cat_api/domain/entities/cat/weight_entity.dart';
import 'package:cat_api/domain/repositories/cat/cat_repository_domain.dart';
import 'package:cat_api/inject.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  test('Fetch Api Cat All', () async {
    final useCase = ProviderContainer();
    final fetch = await useCase.read(catUseCaseProvider).getCats();
    expect(fetch.isNotEmpty, true);
  });

  test('Fetch Api Cat All With Repository Fake', () async {
    final useCase = ProviderContainer(
      overrides: [
        catRepositoryProvider.overrideWithValue(CatRepositoryDataFake())
      ],
    );
    final fetch = await useCase.read(catUseCaseProvider).getCats();
    expect(fetch.isNotEmpty, true);
  });

  test('Name not found', () async {
    final useCase = ProviderContainer();
    final fetch =
        await useCase.read(catUseCaseProvider).getCats(name: 'americcccan');
    expect(fetch.length, 0);
  });

  test('Cat by name', () async {
    final useCase = ProviderContainer();
    final fetch =
        await useCase.read(catUseCaseProvider).getCats(name: 'american');
    expect(fetch.isNotEmpty, true);
  });
}

///This class is a copy of our repository to just pass on false information
class CatRepositoryDataFake implements CatRepositoryDomain {
  //this
  @override
  Future<List<CatEntity>> getCatEntity({String? name}) async {
    //We're going to map the catModel list and return a new list in it,
    // but from toCatEntity which would be our catEntity intent
    return [
      CatEntity(WeightEntity(imperial: 'imperial', metric: '23'), '1',
          'Gato con botas', 'Colombia', 'Tiene botas', 4, 'webImage')
    ];
  }
}
