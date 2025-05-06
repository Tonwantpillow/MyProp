import 'package:flutter/material.dart';
import '../../domain/entities/item.dart';

class ItemWidget extends StatelessWidget {
  final Item item;
  final VoidCallback onTap;

  const ItemWidget({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(item.title),
        subtitle: Text(
          item.description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        onTap: onTap,
      ),
    );
  }
}
