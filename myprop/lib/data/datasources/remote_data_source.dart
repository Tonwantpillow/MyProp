import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:myprop/data/models/item_model.dart';

abstract class RemoteDataSource {
  Future<List<ItemModel>> getItems();
  Future<ItemModel> getItemById(int id);
  Future<void> updateItem(ItemModel item);
  Future<void> addItem(ItemModel item);
  Future<void> deleteItem(int id);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;
  final String baseUrl = '';
  
  RemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<List<ItemModel>> getItems() async {
    final response = await client.get(
      Uri.parse('$baseUrl/items'),
      headers: {'Content-Type': 'application/json'},
    );
    
    if (response.statusCode ==  200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => ItemModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load items');
    }
  }

  @override
  Future<ItemModel> getItemById(int id) async {
    final response = await client.get(
      Uri.parse('$baseUrl/items/$id'),
      headers: {'Content-Type':'application/json'},
    );

    if (response.statusCode == 200) {
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load item');
    }
  }

  @override
  Future<void> updateItem(ItemModel item) async {
    final response = await client.put(
      Uri.parse('$baseUrl/items/${item.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(item.toJson())
    );
    
    if (response.statusCode != 200) {
      throw Exception('Failed to update item');
    }
  }

  @override
  Future<void> addItem(ItemModel item) async {
    final response = await client.post(
      Uri.parse('$baseUrl/items'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(item.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to add item');
    }
  }

  @override
  Future<void> deleteItem(int id) async {
    final response =  await client.delete(
      Uri.parse('$baseUrl/items/$id'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete item');
    }
  }
}