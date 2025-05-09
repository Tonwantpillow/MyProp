import 'package:equatable/equatable.dart';

class Item extends Equatable {
  final int? id;
  final DateTime? createdAt;
  final String owner;
  final String address;
  final String email;
  final String groupName;
  final int propNo;
  final int currentE;
  final int currentW;

  const Item({
    this.id,
    this.createdAt,
    required this.owner,
    required this.address,
    required this.email,
    required this.groupName,
    required this.propNo,
    required this.currentE,
    required this.currentW,
  });

  @override
  List<Object> get props => [
        id ?? 0,
        createdAt ?? DateTime.now(),
        owner,
        address,
        email,
        groupName,
        propNo,
        currentE,
        currentW,
      ];
}