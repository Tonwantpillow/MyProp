import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myprop/presentation/bloc/item/item_bloc.dart';
import 'package:myprop/presentation/bloc/item/item_event.dart';
import 'package:myprop/presentation/bloc/item/item_state.dart';
import 'package:myprop/presentation/pages/detail_page.dart';
import 'package:myprop/presentation/pages/manage_page.dart';
import 'package:myprop/presentation/widgets/item_widget.dart';
import 'package:myprop/presentation/widgets/welcome_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final pages = [
    ManagePage(), const Center(child: Text('Favorite')), const Center(child: Text('Settings'),)
  ];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ItemBloc>(context).add(GetItemsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: pages[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() {
          _selectedIndex = index;
        }),
        items: const [
          BottomNavigationBarItem(icon: Padding(
            padding: EdgeInsets.only(top: 8),
            child: Icon(Icons.home),
          ), label: 'Manage'),
          BottomNavigationBarItem(icon: Padding(
            padding: EdgeInsets.only(top: 8),
            child: Icon(Icons.star),
          ), label: 'Favorites'),
          BottomNavigationBarItem(icon: Padding(
            padding: EdgeInsets.only(top: 8),
            child: Icon(Icons.settings),
          ), label: 'Settings'),
        ],
      ),
    );
  }
}

