import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';



Firestore _firestore=Firestore.instance;

class CounterProvider with ChangeNotifier {
        
  List<Map> _todoes=[];
  // List<Map> _todoes = [
  //   {'activity': 'eat', 'time': '4:30', 'category': 'flexing'},
  //   {'activity': 'dance arafat', 'time': '7:30', 'category': 'dancing'}
  // ];

  set addTodo (Map value){
    _todoes.add(value);
   
  }

  get readTodoList => _todoes;
  
  int _counter=0;
  get readCounter => _counter;
  set setCounter (int value){
    _counter = _counter + value;
    notifyListeners();
  }




}

