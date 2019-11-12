import 'package:flutter/widgets.dart';

class DataProvider with ChangeNotifier {
  List<Map> _todoes = [
    {'activity': 'eat', 'time': '4:30', 'category': 'flexing'},
    {'activity': 'dance arafat', 'time': '7:30', 'category': 'dancing'}
  ];

  set addTodo (Map value){
    _todoes.add(value);
    notifyListeners();
  }

  get readTodoList => _todoes;
  
  int _counter=0;
  get readCounter => _counter;
  set setCounter (int value){
    _counter = _counter + value;
    notifyListeners();
  }
}
