import 'package:flutter/material.dart';
import 'package:frivia_app/Providers/game_page_providers.dart';
import 'package:frivia_app/Views/game_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context)=> GamePageProviders(context: context), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Frivia',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'ArchitectsDaughter',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: GamePage());
  }
}
