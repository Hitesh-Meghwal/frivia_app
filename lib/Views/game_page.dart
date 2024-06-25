import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:frivia_app/Providers/game_page_providers.dart';

class GamePage extends StatelessWidget {
  final String difficultyLevel;
  GamePage({super.key, required this.difficultyLevel});
  late double _deviceWidth, _deviceHeight;

  @override
  Widget build(BuildContext context) {
     _deviceWidth = MediaQuery.of(context).size.width;
     _deviceHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.cyan[800],
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: _deviceWidth * 0.05),
          child: _buildUI(context),
        ),
      ),
    );
  }

  Widget _buildUI(BuildContext context) {
    return Consumer<GamePageProviders>(
      builder: (context, _pageProvider, child) {
        if (_pageProvider.questions == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (_pageProvider.questions!.isEmpty) {
          return Center(
            child: Text(
              "No questions available",
              style: TextStyle(color: Colors.white, fontSize: _deviceWidth * 0.08),
            ),
          );
        } else {  
          return _gameUI(context, _pageProvider);
        }
      },
    );
  }

  Widget _gameUI(BuildContext context, GamePageProviders _pageProvider) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _questionText(context, _pageProvider),
        Column(
          children: [
            _trueButton(context, _pageProvider),
            SizedBox(
              height: _deviceHeight * 0.05,
            ),
            _falseButton(context, _pageProvider),
          ],
        ),
      ],
    );
  }

  Widget _questionText(
      BuildContext context, GamePageProviders _pageProvider) {
    return Text(
      _pageProvider.getCurrentQuestionText(),
      style: TextStyle(color: Colors.white, fontSize: _deviceWidth *  0.08),
      textAlign: TextAlign.center,
    );
  }

  Widget _trueButton(
      BuildContext context, GamePageProviders _pageProvider) {
    return MaterialButton(
      onPressed: () {
        _pageProvider.answerQuestion(context, "True");
      },
      color: Colors.green,
      minWidth: _deviceWidth * 0.7,
      height: _deviceHeight * 0.1,
      child: Text(
        "True",
        style: TextStyle(color: Colors.white, fontSize: _deviceWidth * 0.12),
      ),
    );
  }

  Widget _falseButton(
      BuildContext context, GamePageProviders _pageProvider) {
    return MaterialButton(
      onPressed: () {
        _pageProvider.answerQuestion(context, "False");
      },
      color: Colors.red,
      minWidth: _deviceWidth * 0.7,
      height: _deviceHeight * 0.1 ,
      child: Text(
        "False",
        style: TextStyle(color: Colors.white, fontSize: _deviceWidth * 0.12),
      ),
    );
  }
}
