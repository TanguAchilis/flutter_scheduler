import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel{
  final String activity;
  final String time;
  final String date;
  final String category;
  final bool status;
  final String id;
  TaskModel({this.activity, this.time, this.date, this.category, this.status, this.id});
  
  factory TaskModel.fromFirestore(DocumentSnapshot doc){
    Map data = doc.data;
    
    return TaskModel(
      id: doc.documentID,
      activity: data['activity'] ?? '',
      time: data['time'] ?? '',
      date: data['date'] ?? '',
      category: data['category'] ?? '',
      status: data['status'] ?? false,
    );
  }
}