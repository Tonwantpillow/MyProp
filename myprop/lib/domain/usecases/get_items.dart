import 'package:dartz/dartz.dart';
import 'package:myprop/core/error/failures.dart';
import 'package:myprop/core/usecases/usecase.dart';
import 'package:myprop/domain/entities/item.dart';
import 'package:myprop/domain/repositories/item_repository.dart';

class GetItems implements UseCase<List<Item>, NoParams> {
  final ItemRepository repository;

  GetItems(this.repository);

  @override
  Future<Either<Failure, List<Item>>> call(NoParams params) async {
    return repository.getItems();
  }
}