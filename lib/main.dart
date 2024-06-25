import 'package:flutter/material.dart';
import 'package:frivia_app/Views/home_page.dart';
import 'package:provider/provider.dart';
import 'package:frivia_app/Providers/game_page_providers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GamePageProviders(),
      child: MaterialApp(
        title: 'Frivia',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          fontFamily: 'ArchitectsDaughter', 
        ),
        home: const HomePage(),
      ),
    );
  }
}
