import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myprop/data/models/item_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class RemoteDataSource {
  Future<List<ItemModel>> getItems();
  Future<ItemModel> getItemById(int id);
  Future<void> updateItem(ItemModel item);
  Future<void> addItem(ItemModel item);
  Future<void> deleteItem(int id);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  // final http.Client client;
  final SupabaseClient sbClient;
  final String baseUrl = '';
  
  RemoteDataSourceImpl({
    required this.sbClient,
  });
  
  @override
  Future<List<ItemModel>> getItems() async {
    // final response = await client.get(
    //   Uri.parse('$baseUrl/items'),
    //   headers: {'Content-Type': 'application/json'},
    // );
    
    // if (response.statusCode ==  200) {
    //   final List<dynamic> jsonList = json.decode(response.body);
    //   return jsonList.map((json) => ItemModel.fromJson(json)).toList();
    // } else {
    //   throw Exception('Failed to load items');
    // }
    final response = await sbClient.from('House').select().order('created_at', ascending: false);
    return (response as List).map((json) => ItemModel.fromJson(json)).toList();
  }

  @override
  Future<ItemModel> getItemById(int id) async {
    final response = await sbClient.from('House').select().eq('id', id).single();
    return ItemModel.fromJson(response);
  }

  @override
  Future<void> updateItem(ItemModel item) async {
    await sbClient.from('House').update(item.toJson()).eq('id', item.id);
  }

  @override
  Future<void> addItem(ItemModel item) async {
    await sbClient.from('House').insert(item.toJson());
  }

  @override
  Future<void> deleteItem(int id) async {
    await sbClient.from('House').delete().eq('id', id);
  }
}