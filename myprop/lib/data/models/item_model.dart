import 'package:myprop/domain/entities/item.dart';

class ItemModel extends Item {
  const ItemModel({
    required super.id,
    required super.title,
    required super.description,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
    );
  }
  
  Map<String, dynamic> toJson() {
    return { 
      'id': id,
      'title': title,
      'description': description,
    };
  }

  factory ItemModel.fromEntiy(Item item) {
    return ItemModel (
      id: item.id,
      title: item.title,
      description: item.description,
    );
  }
}
