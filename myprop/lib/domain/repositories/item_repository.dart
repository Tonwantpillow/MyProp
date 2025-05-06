import 'package:dartz/dartz.dart';
import 'package:myprop/core/error/failures.dart';
import 'package:myprop/domain/entities/item.dart';

abstract class ItemRepository {
  Future<Either<Failure, List<Item>>> getItems();
  Future<Either<Failure, Item>> getItemById(int id);
  Future<Either<Failure, void>> updateItem(Item item);
  Future<Either<Failure, void>> addItem(Item item);
  Future<Either<Failure, void>> deleteItem(int id);
}
