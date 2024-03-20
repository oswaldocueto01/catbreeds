import 'package:cat_api/core/utils/logger.dart';
import 'package:cat_api/domain/entities/cat/cat_entity.dart';
import 'package:cat_api/inject.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cats_home_provider.freezed.dart';

/// Definición de un proveedor de estado para la gestión de gatos
final catProvider = StateNotifierProvider<CatProvider, CatState>(
    (ref) => CatProvider(ref, const CatState()));

/// Class CatProvider
///
/// Defining a Status Provider for Cat Management.
class CatProvider extends StateNotifier<CatState> {
  CatProvider(this.ref, super.state);

  final Ref ref;

  ///In this method we're going to call the use case and get the information and
  ///Update Status
  ///
  ///[name]: Name of the cat to look for (optional) which is if
  ///to search or load the entire list.
  Future<void> getCats({String? name}) async {
    try {
      ///At this point in the method, we set the status to "loading".
      state = state.copyWith(pageState: const AsyncValue.loading());
      ///We get the list of cats from the use case.
      final result = await ref.read(catUseCaseProvider).getCats(name: name);

      /// Updated the status with the list of cats obtained.
      state =
          state.copyWith(cats: result, pageState: const AsyncValue.data(null));
    } catch (e) {
      logger.e(e);

      ///The status changes to error if I enter the catch.
      state =
          state.copyWith(pageState: AsyncValue.error(e, StackTrace.current));
    }
  }
}

///Generates a file for the boilerplate code for handling
///immutable states and be able to change their state using the copyWith() method
@freezed
class CatState with _$CatState {
  const factory CatState({
    /// We use [pageState] to know the state of the page during the
    /// execution of the.
    ///
    /// You can have values such as "loading", "error", or "null" to
    /// indicate that you are not loading.
    @Default(AsyncData<void>(null)) AsyncValue<void> pageState,
    @Default([]) List<CatEntity> cats,
  }) = _CatState;
}
