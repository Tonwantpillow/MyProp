import 'package:equatable/equatable.dart';

class Item extends Equatable {
  final int id;
  final DateTime createdAt;
  final String owner;
  final String address;
  final String email;
  final int currentE;  // Assuming "current-e" in table
  final int currentW;  // Assuming "current-w" in table

  const Item({
    required this.id,
    required this.createdAt,
    required this.owner,
    required this.address,
    required this.email,
    required this.currentE,
    required this.currentW,
  });

  @override
  List<Object> get props => [
        id,
        createdAt,
        owner,
        address,
        email,
        currentE,
        currentW,
      ];
}