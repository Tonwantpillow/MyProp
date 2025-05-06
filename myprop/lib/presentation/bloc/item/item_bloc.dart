import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myprop/core/error/failures.dart';
import 'package:myprop/core/usecases/usecase.dart';
import 'package:myprop/domain/usecases/get_items.dart';
import 'package:myprop/presentation/bloc/item/item_event.dart';
import 'package:myprop/presentation/bloc/item/item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final GetItems getItems;

  ItemBloc({
    required this.getItems,
  }) : super(ItemInitial()) {
    on<GetItemsEvent>(_onGetItems);
  }

  Future<void> _onGetItems(
    GetItemsEvent event,
    Emitter<ItemState> emit,
  ) async {
      emit(ItemLoading());

      final result = await getItems(NoParams());

      result.fold(
    (failure) {
      final message = _mapFailureToMessage(failure);
      emit(ItemError(message));
    },
    (items) {
      emit(ItemsLoaded(items));
    },
  );
  }

  String _mapFailureToMessage (Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Server Failure';
      case CacheFailure:
        return 'Cache Failure';
      case NetworkFailure: 
        return 'Network Failure';
      default:
        return 'Unexpected Error';
    }
  }
}