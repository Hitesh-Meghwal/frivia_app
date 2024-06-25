import 'package:flutter/material.dart';
import 'package:frivia_app/Views/game_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late double _deviceWidth, _deviceHeight;
  double _currentValue = 20;

  @override
  Widget build(BuildContext context) {
    _deviceWidth = MediaQuery.of(context).size.width;
    _deviceHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.cyan[800],
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("FriVia", style: TextStyle(color: Colors.white, fontSize: _deviceWidth * 0.18),),
              _sliderwidget(),
              _button()
            ],
          ),
      ),
    );
  }

  Widget _sliderwidget(){
    return Slider(
      value: _currentValue, 
      max: 100,
      divisions: 3,
      label: _currentValue.round().toString(),
      onChanged: (double value){
        setState(() {
          _currentValue = value;
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