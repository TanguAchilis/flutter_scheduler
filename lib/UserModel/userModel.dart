import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_schedular/Utils/userVariables.dart';


class UserProfileModel{
  String userId;
  String name;
  String email;
  String phoneNumber;
  String profilePicUrl;


  UserProfileModel({this.userId, this.name,
       this.profilePicUrl,this.email
    });

  factory UserProfileModel.fromFirestore(DocumentSnapshot docSnapShot){

    return UserProfileModel(
      userId: docSnapShot.data[Config.userId],
      name: docSnapShot.data[Config.fullNames],
      email: docSnapShot.data[Config.email],
  
    );
  }


}