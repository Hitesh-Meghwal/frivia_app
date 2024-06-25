import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

class GamePageProviders extends ChangeNotifier{
  final Dio _dio = Dio();
  final int _maxQuestions= 10;
  String difficultyLevel;
  List? questions;
  int _currentQuestionCount = 0;
  int _correctCount = 0;

  GamePageProviders({required this.difficultyLevel}){
    _dio.options.baseUrl = "https://opentdb.com/api.php";
    _getQuestionsFromApi();
    
  }

  Future<void> _getQuestionsFromApi() async {
    try{

        var response = await _dio.get('',queryParameters:{
      'amount':10,'type':'boolean','difficulty':difficultyLevel
    } );
    var _data = jsonDecode(response.toString());
    questions = _data['results'];
    notifyListeners();
    }
    catch(e){
      print("Failed to Fetch question from API $e");
    }
  }

  String getCurrentQuestionText(){
    return questions![_currentQuestionCount]["question"];

  }

  void setDifficultyLevel(String level) {
    difficultyLevel = level;
    _getQuestionsFromApi(); // Reload questions with the new difficulty level
  }

  void answerQuestion(BuildContext context,String _answer) async{
    bool isCorrect = questions![_currentQuestionCount]["correct_answer"] == _answer;
    _correctCount += isCorrect ? 1 : 0;
    showDialog(context: context, builder: (BuildContext  context){
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
          Icon(isCorrect? Icons.check_circle : Icons.cancel_sharp, color: Colors.white),
          SizedBox(height: MediaQuery.of(context).size.height * 0.015,),
          Text(isCorrect? "Right" : "Wrong", style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.width * 0.06),),
        ],),
        backgroundColor: isCorrect? Colors.green : Colors.red,

      );
    });

    await Future.delayed(const Duration(seconds: 1));
    Navigator.of(context).pop();

    _currentQuestionCount ++ ;
    
    if(_currentQuestionCount == _maxQuestions){
      endGame(context);
    }
    else{
      notifyListeners();
    }
  }

  Future<void> endGame(BuildContext context) async{
    showDialog(context: context, builder: (BuildContext  context){
      return AlertDialog(
        backgroundColor: Colors.blue,
        title: Center(child: Text("Game End!!",style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.width * 0.08))),
        content: Text("Score: $_correctCount/$_maxQuestions",style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.width * 0.06)),
      );
    });

    await Future.delayed(const Duration(seconds: 3));
    _currentQuestionCount = 0;
    
    Navigator.of(context).pop(); //to close dialod box
    Navigator.of(context).pop(); // to close gamepage screen and goes back to homepage
  }


 }