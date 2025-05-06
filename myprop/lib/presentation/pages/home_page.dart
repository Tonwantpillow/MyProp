import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myprop/presentation/bloc/item/item_bloc.dart';
import 'package:myprop/presentation/bloc/item/item_event.dart';
import 'package:myprop/presentation/bloc/item/item_state.dart';
import 'package:myprop/presentation/pages/detail_page.dart';
import 'package:myprop/presentation/widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ItemBloc>(context).add(GetItemsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyProp'),
      ),
      body: BlocBuilder<ItemBloc, ItemState>(
        builder: (context, state) {
          if (state is ItemLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          else if (state is ItemsLoaded) {
            if (state.items.isEmpty) {
              return const Center(child: Text('No items found.'),);
            } else {
              return ListView.builder(
                itemCount: state.items.length,
                itemBuilder: (context, index) {
                  final item = state.items[index];
                  return ItemWidget(
                    item: item,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(itemId: item.id),
                        )
                      );
                    },
                  );
                },
              );
            }
          }
          else if (state is ItemError) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.red),
              )
            );
          }
          return const Center(child: Text('No items found'),);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

