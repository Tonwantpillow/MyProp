import 'package:dartz/dartz.dart';
import 'package:myprop/core/error/failures.dart';
import 'package:myprop/core/usecases/usecase.dart';
import 'package:myprop/domain/entities/item.dart';
import 'package:myprop/domain/repositories/item_repository.dart';

class GetItemById implements UseCase<Item, int> {
  final ItemRepository repository;

  GetItemById(this.repository);
  
  @override
  Future<Either<Failure,Item>> call(int id) {
    return repository.getItemById(id);
  }

}