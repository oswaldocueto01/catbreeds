import 'package:cat_api/core/utils/logger.dart';
import 'package:cat_api/domain/entities/cat/cat_entity.dart';
import 'package:cat_api/inject.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cats_home_provider.freezed.dart';

final catProvider = StateNotifierProvider<CatProvider, CatState>(
    (ref) => CatProvider(ref, const CatState()));

class CatProvider extends StateNotifier<CatState> {
  CatProvider(this.ref, super.state);

  final Ref ref;

  Future<void> getCats({String? name}) async {
    try {
      state = state.copyWith(pageState: const AsyncValue.loading());
      final result = await ref.read(catUseCaseProvider).getCats(name: name);

      state =
          state.copyWith(cats: result, pageState: const AsyncValue.data(null));
    } catch (e) {
      logger.e(e);
      state =
          state.copyWith(pageState: AsyncValue.error(e, StackTrace.current));
    }
  }
}

@freezed
class CatState with _$CatState {
  const factory CatState({
    @Default(AsyncData<void>(null)) AsyncValue<void> pageState,
    @Default([]) List<CatEntity> cats,
  }) = _CatState;
}
