import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:frivia_app/Providers/game_page_providers.dart';
import 'package:frivia_app/Views/game_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GamePageProviders(context: context),
      child: MaterialApp(
        title: 'Frivia',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          fontFamily: 'ArchitectsDaughter',
        ),
        home: GamePage(),
      ),
    );
  }
}
