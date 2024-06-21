import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class GamePageProviders extends ChangeNotifier{
  final Dio _dio = Dio();
  final int _maxQuestions= 10;
  List? _questions;

  BuildContext context;
  GamePageProviders({required this.context}){
    _dio.options.baseUrl = "https://opentdb.com/api.php";
    _getQuestionsFromApi();
    
  }

  Future<void> _getQuestionsFromApi() async {
    var response = await _dio.get('',queryParameters:{
      'amount':10,'type':'boolean','difficulty':'easy'
    } );
    var _data = jsonDecode(response.toString());
    _questions = _data['results'];
    print(_questions);
  }
 }