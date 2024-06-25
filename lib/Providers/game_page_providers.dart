import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:frivia_app/Views/home_page.dart';

class GamePageProviders extends ChangeNotifier{
  final Dio _dio = Dio();
  final int _maxQuestions= 10;
  List? questions;
  int _currentQuestionCount = 0;

  GamePageProviders(){
    _dio.options.baseUrl = "https://opentdb.com/api.php";
    _getQuestionsFromApi();
    
  }

  Future<void> _getQuestionsFromApi() async {
    try{
        var response = await _dio.get('',queryParameters:{
      'amount':10,'type':'boolean','difficulty':'easy'
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

  void answerQuestion(BuildContext context,String _answer) async{
    bool isCorrect = questions![_currentQuestionCount]["correct_answer"] == _answer;

    showDialog(context: context, builder: (BuildContext  context){
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
          Icon(isCorrect? Icons.check_circle : Icons.cancel_sharp, color: Colors.white),
          const SizedBox(height: 10.0,),
          Text(isCorrect? "Right" : "Wrong", style: const TextStyle(color: Colors.white,fontSize: 18),),
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
      return const AlertDialog(
        backgroundColor: Colors.blue,
        title: Text("Game End!!",style: TextStyle(color: Colors.white,fontSize: 25)),
        content: Text("Score 0/0",style: TextStyle(color: Colors.white,fontSize: 25) ),
      );
    });

    await Future.delayed(const Duration(seconds: 3));
    
    Navigator.of(context).pop();
    Navigator.of(context).pop();
    // Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
  }


 }