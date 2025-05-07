import 'package:myprop/domain/entities/item.dart';

class ItemModel extends Item {
  const ItemModel({
    required int id,
    required DateTime createdAt,
    required String owner,
    required String address,
    required String email,
    required int currentE,
    required int currentW,
  }) : super(
          id: id,
          createdAt: createdAt,
          owner: owner,
          address: address,
          email: email,
          currentE: currentE,
          currentW: currentW,
        );

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json['id'] as int,
      // Handle both String and DateTime formats for timestampz
      createdAt: json['created_at'] is DateTime 
          ? json['created_at'] as DateTime
          : DateTime.parse(json['created_at'] as String),
      owner: json['owner'] as String,
      address: json['address'] as String,
      email: json['email'] as String,
      currentE: json['current-e'] as int,
      currentW: json['current-w'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      // Convert to ISO 8601 string for Supabase
      'created_at': createdAt.toUtc().toIso8601String(),
      'owner': owner,
      'address': address,
      'email': email,
      'current-e': currentE,
      'current-w': currentW,
    };
  }

  factory ItemModel.fromEntity(Item item) {
    return ItemModel(
      id: item.id,
      createdAt: item.createdAt,
      owner: item.owner,
      address: item.address,
      email: item.email,
      currentE: item.currentE,
      currentW: item.currentW,
    );
  }

   Item toEntity() {
    return Item(
      id: id,
      createdAt: createdAt,
      owner: owner,
      address: address,
      email: email,
      currentE: currentE,
      currentW: currentW,
    );
  }
}
