import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GamePage extends StatelessWidget {
  GamePage({super.key});

  late double _deviceWidth, _deviceHeight;

  @override
  Widget build(BuildContext context) {
    _deviceWidth = MediaQuery.of(context).size.width;
    _deviceHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.cyan[800],
        body: _buildUI(),
      ),
    );
  }

  Widget _buildUI() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: _deviceWidth * 0.05),
      child: _gameUI(),
    );
  }

  Widget _gameUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _questionText(),
        Column(
          children: [
            _truebutton(),
            SizedBox(
              height: _deviceHeight * 0.05,
            ),
            _falsebutton(),
          ],
        )
        ],
    );
  }

  Widget _questionText() {
    return const Text("Text Question 1, Nothing Interesting",
        style: TextStyle(
            color: Colors.white, fontSize: 25, fontWeight: FontWeight.w400));
  }

  Widget _truebutton() {
    return MaterialButton(
      onPressed: () {},
      color: Colors.green,
      minWidth: _deviceWidth * 0.80,
      height: _deviceHeight * 0.10,
      child: const Text(
        "True",
        style: TextStyle(color: Colors.white, fontSize: 25),
      ),
    );
  }

    Widget _falsebutton() {
    return MaterialButton(
      onPressed: () {},
      color: Colors.red,
      minWidth: _deviceWidth * 0.80,
      height: _deviceHeight * 0.10,
      child: const Text(
        "False",
        style: TextStyle(color: Colors.white, fontSize: 25),
      ),
    );
  }
}
