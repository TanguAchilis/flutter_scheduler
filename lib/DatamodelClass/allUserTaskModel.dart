import 'package:cloud_firestore/cloud_firestore.dart';


class UserTaskModel{
  String certId;

  UserTaskModel({this.certId});

  factory UserTaskModel.fromFirestore(DocumentSnapshot docSnap){
    return UserTaskModel(
      certId: docSnap.data['taskId']
    );
  }


}