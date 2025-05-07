import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:myprop/core/network/network_info.dart';
import 'package:myprop/data/datasources/local_data_source.dart';
import 'package:myprop/data/datasources/remote_data_source.dart';
import 'package:myprop/data/repositories/item_repository_impl.dart';
import 'package:myprop/domain/repositories/item_repository.dart';
import 'package:myprop/domain/usecases/get_item_by_id.dart';
import 'package:myprop/domain/usecases/get_items.dart';
import 'package:myprop/presentation/bloc/item/item_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Use cases
  sl.registerLazySingleton(() => GetItems(sl()));
  sl.registerLazySingleton(()=> GetItemById(sl()));
  // Bloc
  sl.registerFactory(
    () => ItemBloc(
      getItems: sl<GetItems>(),
      getItemById: sl<GetItemById>(),
    ),
  );


  // Repository
  sl.registerLazySingleton<ItemRepository>(
    () => ItemRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  // sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker.createInstance());

  sl.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);
  // Data source
  sl.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(sbClient: sl()),
  );

  sl.registerLazySingleton<LocalDataSource>(
    () => LocalDataSourceImpl(sharedPreferences: sl()),
  );

  // Core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(sl()),
  );


}