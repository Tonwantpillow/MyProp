import 'package:equatable/equatable.dart';
import 'package:myprop/domain/entities/item.dart';

abstract class ItemEvent extends Equatable {
  const ItemEvent();
  @override
  List<Object> get props => [];
}

class GetItemsEvent extends ItemEvent {}

class GetItemByIdEvent extends ItemEvent {
  final int id;

  const GetItemByIdEvent(this.id);
  
  @override
  List<Object> get props => [id];
}

class AddItemEvent extends ItemEvent {
  final Item item;
  
  const AddItemEvent(this.item);
  
  @override
  List<Object> get props => [item];
}

class UpdateItemEvent extends ItemEvent {
  final Item item;

  const UpdateItemEvent(this.item);

  @override
  List<Object> get props => [item];
}

class DeleteItemEvent extends ItemEvent {
  final int id;

  const DeleteItemEvent(this.id);

  @override
  List<Object> get props => [id];
}