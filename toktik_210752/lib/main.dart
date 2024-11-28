import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik_210752/config/app_theme.dart';
import 'package:toktik_210752/presentation/providers/discover_provider.dart';
import 'package:toktik_210752/presentation/screens/discover_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => DiscoverProvider())],
      child: MaterialApp(
          title: 'TokTik 210752',
          debugShowCheckedModeBanner: false,
          theme: AppTheme().getTheme(),
          home: const DiscoverScreen()),
    );
  }
}
