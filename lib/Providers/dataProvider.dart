import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_schedular/DatamodelClass/allUserTaskModel.dart';
import 'package:my_schedular/DatamodelClass/taskModel.dart';
import 'package:my_schedular/UserModel/userModel.dart';
import 'package:my_schedular/Utils/userVariables.dart';
import 'package:provider/provider.dart';


Firestore _firestore=Firestore.instance;

class DataProvider with ChangeNotifier {

    Firestore _firestore ;

  DataProvider.instance() : _firestore = Firestore.instance;
        
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


/// here we are getting the user data for the profile page
  Stream<UserProfileModel> streamRegularUserProfile(String userId) {
    return _firestore
        .collection(Config.users).document(userId)

        .snapshots()

        .map((snap) {
      print(snap.data.toString());
      return UserProfileModel.fromFirestore(snap);
    });
  }



/// save users info
  Future<void> saveUserData(String userId,Map userDataMap){

    return _firestore.collection('Users').document(userId).setData(userDataMap,merge: true).then((_){
      print("successful");
    });
  }

  

//save user task
  Future<void> saveCertificate(String userId,Map taskMap){

    return  _firestore.collection(Config.userTask).add(taskMap).then((DocumentReference docRef){

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
        .collection(Config.task).document(taskId).delete().then((_){
          _firestore.collection(Config.users).document(userId).collection(Config.userTask)
              .document(taskId).delete();
    });
}


    /// Get a stream of all userTask
  Stream<List<UserTaskModel>> streamUserTasks(String userId){
    return  _firestore
        .collection(Config.users)
        .document(userId)
        .collection(Config.userTask)
        .snapshots()
        .map((list) =>
        list.documents.map((doc) => UserTaskModel.fromFirestore(doc)).toList());
  }


  /// stream single certificate document
  Stream<TaskModel> streamTaskDocument(String taskId) {
    return _firestore
        .collection(Config.task).document(taskId)

        .snapshots()

        .map((snap) {
      print(snap.data.toString());
      return TaskModel.fromFirestore(snap);
    });
  }

}

