import 'package:myprop/domain/entities/item.dart';

class ItemModel extends Item {
  const ItemModel({
    int? id,
    DateTime? createdAt,
    required String owner,
    required String address,
    required String email,
    required String groupName,
    required int propNo,
    required int currentE,
    required int currentW,
  }) : super(
          id: id,
          createdAt: createdAt,
          owner: owner,
          address: address,
          email: email,
          groupName: groupName,
          propNo: propNo,
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
      groupName: json['group_name'] as String,
      propNo: json['prop_no'] as int,
      currentE: json['current-e'] as int,
      currentW: json['current-w'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'owner': owner,
      'address': address,
      'email': email,
      'group_name': groupName,
      'prop_no': propNo,
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
      groupName: item.groupName,
      propNo: item.propNo,
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
      groupName: groupName,
      propNo: propNo,
      currentE: currentE,
      currentW: currentW,
    );
  }
}
