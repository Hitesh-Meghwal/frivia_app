import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:frivia_app/Providers/game_page_providers.dart';

class GamePage extends StatelessWidget {
  GamePage({super.key});
  late double _deviceWidth, _deviceHeight;

  @override
  Widget build(BuildContext context) {
    _deviceWidth = MediaQuery.of(context).size.width;
    _deviceHeight = MediaQuery.of(context).size.height;
    return _buildUI(context);
  }

  Widget _buildUI(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.cyan[800],
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: _deviceWidth * 0.05),
          child: _gameUI(context),
        ),
      ),
    );
  }

  Widget _gameUI(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _questionText(context),
        Column(
          children: [
            _trueButton(),
            SizedBox(
              height: _deviceHeight * 0.05,
            ),
            _falseButton(),
          ],
        ),
      ],
    );
  }

  Widget _questionText(BuildContext context) {
    return Consumer<GamePageProviders>(
      builder: (context, _pageProvider, child) {
        if (_pageProvider.questions == null) {
          return CircularProgressIndicator();
        } else if (_pageProvider.questions!.isEmpty) {
          return const Text(
            "No questions available",
            style: TextStyle(color: Colors.white, fontSize: 24),
          );
        } else {
          return Text(
            _pageProvider.getCurrentQuestionText(),
            style: TextStyle(color: Colors.white, fontSize: 24),
            textAlign: TextAlign.center,
          );
        }
      },
    );
  }

  Widget _trueButton() {
    return MaterialButton(
      onPressed: () {

      },
      color: Colors.green,
      minWidth: _deviceWidth * 0.80,
      height: _deviceHeight * 0.10,
      child: const Text(
        "True",
        style: TextStyle(color: Colors.white, fontSize: 28),
      ),
    );
  }

  Widget _falseButton() {
    return MaterialButton(
      onPressed: () {

      },
      color: Colors.red,
      minWidth: _deviceWidth * 0.80,
      height: _deviceHeight * 0.10,
      child: const Text(
        "False",
        style: TextStyle(color: Colors.white, fontSize: 28),
      ),
    );
  }
}
