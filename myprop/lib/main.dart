import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myprop/core/theme/app_theme.dart';
import 'package:myprop/presentation/bloc/item/item_bloc.dart';
import 'package:myprop/presentation/bloc/item/item_event.dart';
import 'package:myprop/presentation/pages/home_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://gufgjfvpsegrziftmorl.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imd1ZmdqZnZwc2VncnppZnRtb3JsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDY1MDcxODQsImV4cCI6MjA2MjA4MzE4NH0.A3OtWGs-a3OeYO9w3hQUmniFp_xg9s1J0YTuRGOJVm0',
  );
  await di.init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ItemBloc>(
          create: (_) => di.sl<ItemBloc>()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyProp',
      theme: AppTheme.lightTheme,
      home: const HomePage(),
    );
  }
}
