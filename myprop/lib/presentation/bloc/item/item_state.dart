import 'package:equatable/equatable.dart';
import 'package:myprop/domain/entities/item.dart';

abstract class ItemState extends Equatable {
  const ItemState();

  @override
  List<Object> get props => [];
}

class ItemInitial extends ItemState {}

class ItemLoading extends ItemState {}

class ItemsLoaded extends ItemState {

  final List<Item> items;

  const ItemsLoaded(this.items);
  
  @override
  List<Object> get props => [items];
}

class ItemLoaded extends ItemState {
  final Item item;
  const ItemLoaded(this.item);

  @override
  List<Object> get props => [item];
}

class ItemAdded extends ItemState {}

class ItemError extends ItemState {
  final String message;

  const ItemError(this.message);

  @override
  List<Object> get props => [message];
}

class ItemOperationSuccess extends ItemState {
  final String message;

  const ItemOperationSuccess(this.message);

  @override
  List<Object> get props => [message];
}