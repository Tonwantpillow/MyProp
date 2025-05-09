import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:myprop/core/error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

class AddItemParams extends Equatable {
  
  final String owner;
  final String address;
  final String email;
  final int propNo;
  final String groupName;
  final int currentE;
  final int currentW;

  const AddItemParams({
    required this.owner,
    required this.address,
    required this.email,
    required this.propNo,
    required this.groupName,
    required this.currentE,
    required this.currentW,
  });
  
  @override
  List<Object> get props => [
    owner,
    address,
    email,
    propNo,
    groupName,
    currentE,
    currentW,
    ];
}

