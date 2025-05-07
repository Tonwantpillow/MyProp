import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myprop/domain/usecases/get_item_by_id.dart';
import 'package:myprop/domain/usecases/get_items.dart';
import 'package:myprop/injection_container.dart';
import 'package:myprop/presentation/bloc/item/item_bloc.dart';
import 'package:myprop/presentation/bloc/item/item_event.dart';
import 'package:myprop/presentation/bloc/item/item_state.dart';
import 'package:myprop/presentation/pages/detail_page.dart';
import 'package:myprop/presentation/widgets/item_widget.dart';
import 'package:myprop/presentation/widgets/welcome_home.dart';

class ManagePage extends StatefulWidget {
  const ManagePage({super.key});

  @override
  State<ManagePage> createState() => _ManagePageState();
}

class _ManagePageState extends State<ManagePage> {
  @override
  initState() {
    super.initState();
    BlocProvider.of<ItemBloc>(context).add(GetItemsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemBloc, ItemState>(
      builder: (context, state) {
        if (state is ItemLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ItemsLoaded) {
          if (state.items.isEmpty) {
            return const Center(child: Text('No items found.'));
          }
          return Column(
            children: [
              const WelcomeHome(),
              Expanded(
                child: ListView.builder(
                  itemCount: state.items.length,
                  itemBuilder: (context, index) {
                    final item = state.items[index];
                    return ItemWidget(
                      item: item,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => BlocProvider(
                                  create: (_) => sl<ItemBloc>()..add(GetItemByIdEvent(item.id)),
                                  child: DetailPage(itemId: item.id),
                                ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          );
        } else if (state is ItemError) {
          return Center(
            child: Text(state.message, style: TextStyle(color: Colors.red)),
          );
        } 
        else {
          return const Center(child: Text('No items found.'));
        }
      },
    );
  }
}
