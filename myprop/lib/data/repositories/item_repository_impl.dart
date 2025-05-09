import 'package:dartz/dartz.dart';
import 'package:myprop/core/error/failures.dart';
import 'package:myprop/core/network/network_info.dart';
import 'package:myprop/data/datasources/local_data_source.dart';
import 'package:myprop/data/datasources/remote_data_source.dart';
import 'package:myprop/data/models/item_model.dart';
import 'package:myprop/domain/entities/item.dart';
import 'package:myprop/domain/repositories/item_repository.dart';

class ItemRepositoryImpl implements ItemRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  ItemRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Item>>> getItems() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteItems = await remoteDataSource.getItems();
        localDataSource.cacheItems(remoteItems);
        return Right(remoteItems);
      } catch (_) {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localItems = await localDataSource.getItems();
        return Right(localItems);
      } catch (_) {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Item>> getItemById(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteItem = await remoteDataSource.getItemById(id);
        return Right(remoteItem);
      } catch (_) {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localItem = await localDataSource.getItemById(id);
        return Right(localItem);
      } catch (_) {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, void>> updateItem(Item item) async {
    final itemModel = ItemModel.fromEntity(item);

    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.updateItem(itemModel);
        await localDataSource.updateItem(itemModel);
        return const Right(null);
      } catch (_) {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
  
  @override
  Future<Either<Failure, void>> addItem(Item item) async {
    final itemModel = ItemModel.fromEntity(item);

    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.addItem(itemModel);
        await localDataSource.addItem(itemModel);
        return const Right(null);
      } catch (_) {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteItem(int id) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.deleteItem(id);
        await localDataSource.deleteItem(id);
        return const Right(null);
      } catch (_) {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}