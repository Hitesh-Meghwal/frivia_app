import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frivia_app/Views/game_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late double _deviceWidth, _deviceHeight;
  double _currentDifficultyLevel = 20;

  final List<String> _difficultyTexts = ['Easy','Medium','High'];

  @override
  Widget build(BuildContext context) {
    _deviceWidth = MediaQuery.of(context).size.width;
    _deviceHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.cyan[800],
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _gameNametxt(),
                _sliderwidget(),
                _button()
              ],
            ),
          ),
      ),
    );
  }

  Widget _gameNametxt(){
    return Column(
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'F',
                style: TextStyle(color: Colors.red, fontFamily: 'ArchitectsDaughter', fontSize: _deviceWidth * 0.3),
              ),
              TextSpan(
                text: 'r',
                style: TextStyle(color: Colors.orange, fontFamily: 'ArchitectsDaughter', fontSize: _deviceWidth * 0.2),
              ),
              TextSpan(
                text: 'i',
                style: TextStyle(color: Colors.yellow, fontFamily: 'ArchitectsDaughter', fontSize: _deviceWidth * 0.2),
              ),
              TextSpan(
                text: 'V',
                style: TextStyle(color: Colors.green, fontSize: _deviceWidth * 0.2),
              ),
              TextSpan(
                text: 'i',
                style: TextStyle(color: Colors.blue, fontFamily: 'ArchitectsDaughter', fontSize: _deviceWidth * 0.2),
              ),
              TextSpan(
                text: 'a',
                style: TextStyle(color: Colors.purple, fontFamily: 'ArchitectsDaughter', fontSize: _deviceWidth * 0.2),
              ),
            ],
          ),
        ),
        Text("$_currentDifficultyLevel", style: TextStyle(color: Colors.white,fontSize: _deviceWidth * 0.8),),

      ],
    );
  }

  Widget _sliderwidget(){
    return Slider(
      value: _currentDifficultyLevel, 
      max: 100,
      divisions: 3,
      activeColor: Colors.cyan[400],
      thumbColor: Colors.white,
      label: _currentDifficultyLevel.round().toString(),
      onChanged: (double value){
        setState(() {
          _currentDifficultyLevel = value;
        });
      },     
      );
  }

  Widget _button(){
    return MaterialButton(
      minWidth: _deviceWidth * 0.5,
      height: _deviceHeight * 0.1,
      color: Colors.cyan[900],
      child: Text("PLAY", style: TextStyle(color: Colors.white, fontSize: _deviceWidth * 0.06),),
      onPressed: (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> GamePage()));
      },
    );
  }
}