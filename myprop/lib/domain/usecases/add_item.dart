import 'package:dartz/dartz.dart';
import 'package:myprop/core/error/failures.dart';
import 'package:myprop/core/usecases/usecase.dart';
import 'package:myprop/domain/entities/item.dart';
import 'package:myprop/domain/repositories/item_repository.dart';

class AddItem implements UseCase<void, AddItemParams> {
  final ItemRepository repository;
  AddItem(this.repository);
  
  @override
  Future<Either<Failure, void>> call(AddItemParams params) {
    final item = Item(owner: params.owner, address: params.address, email: params.email, groupName: params.groupName, propNo: params.propNo, currentE: params.currentE, currentW: params.currentW);
    return repository.addItem(item);
  }
}