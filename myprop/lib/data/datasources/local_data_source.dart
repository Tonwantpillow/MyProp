import 'dart:convert';

import 'package:myprop/data/models/item_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataSource {
  Future<List<ItemModel>> getItems();
  Future<void> cacheItems(List<ItemModel> items);
  Future<ItemModel> getItemById(int id);
  Future<void> updateItem(ItemModel item);
  Future<void> addItem(ItemModel item);
  Future<void> deleteItem(int id);
}

class LocalDataSourceImpl implements LocalDataSource {
  final SharedPreferences sharedPreferences;
  static const String CACHED_ITEMS_KEY = 'CACHED_ITEMS';
  LocalDataSourceImpl({
    required this.sharedPreferences
  });
  
  @override
  Future<List<ItemModel>> getItems() async {
    final jsonString = sharedPreferences.getString(CACHED_ITEMS_KEY);
    if (jsonString != null) {
      final List<dynamic> jsonList = json.decode(jsonString);
      return jsonList.map((json) => ItemModel.fromJson(json)).toList();
    }
    return [];
  }

  @override
  Future<void> cacheItems(List<ItemModel> items) async {
    final List<Map<String, dynamic>> jsonList = items.map((item) => item.toJson()).toList();
    await sharedPreferences.setString(CACHED_ITEMS_KEY, json.encode(jsonList));
  }

  @override
  Future<ItemModel> getItemById(int id) async {
    final items = await getItems();
    return items.firstWhere((item) => item.id == id);
  }

  @override
  Future<void> updateItem(ItemModel item) async {
    final items = await getItems();
    final index = items.indexWhere((i) => i.id == item.id);
    if (index != -1) {
      items[index] = item;
      await cacheItems(items);
    }
  }

  @override
  Future<void> addItem(ItemModel item) async { 
    final items = await getItems();
    items.add(item);
    await cacheItems(items);
  }

  @override
  Future<void> deleteItem(int id) async {
    final items = await getItems();
    items.removeWhere((item) => item.id == id);
    await cacheItems(items);
  }
}

