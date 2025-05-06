import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myprop/presentation/bloc/item/item_bloc.dart';
import 'package:myprop/presentation/pages/home_page.dart';
import 'injection_container.dart' as di;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.sl<ItemBloc>()
        ),
      ],
      child: MaterialApp(
        title: 'MyProp',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true
        ),
        home: const HomePage(),
      ),
    );
  }
}