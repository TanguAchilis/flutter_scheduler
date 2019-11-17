import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_schedular/DatamodelClass/taskModel.dart';
import 'package:provider/provider.dart';


Firestore _firestore=Firestore.instance;

class DataProvider with ChangeNotifier {
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


/// 


/// save users info
  Future<void> saveUserData(String userId,Map userDataMap){

    return _firestore.collection('Users').document(userId).setData(userDataMap,merge: true).then((_){
      print("successful");
    });
  }

  

//save user task
  Future<void> saveCertificate(String userId,Map taskMap){

    return  _firestore.collection('Task').add(taskMap).then((DocumentReference docRef){

      _firestore.collection('Task').document(docRef.documentID).updateData({
        'taskId':docRef.documentID
      }).then((_){
        _firestore.collection('Users').document(userId).collection('UserTask').document(docRef.documentID).setData({
          'taskId':docRef.documentID
        });
      });

    });


  }

  
  /// delete a task document
  Future<void> deleteCertificateDocument(String taskId,String userId) {
    return _firestore
        .collection('Task').document(taskId).delete().then((_){
          _firestore.collection('Users').document(userId).collection('UserTask')
              .document(taskId).delete();
    });
}

  Stream<List<TaskModel>> streamTaskModel(FirebaseUser user) {
    var ref = _firestore.collection('heroes').document(user.uid).collection('weapons');

    return ref.snapshots().map((list) =>
        list.documents.map((doc) => TaskModel.fromFirestore(doc)).toList());
    
  }

}

