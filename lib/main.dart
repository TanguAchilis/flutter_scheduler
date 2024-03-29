import 'package:flutter/material.dart';
import 'package:my_schedular/Pages/activities.dart';
import 'package:my_schedular/Pages/addTodo.dart';
import 'package:my_schedular/Pages/home.dart';
import 'package:my_schedular/Pages/loginPage.dart';
import 'package:my_schedular/Pages/selectLoginOrSignUP.dart';
import 'package:my_schedular/Pages/signUpPage.dart';
import 'package:my_schedular/Providers/counterprovider.dart';
import 'package:my_schedular/Providers/dataProvider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (_) => CounterProvider(),
        ),

        StreamProvider.value(
          value: DataProvider.instance().streamUserTasks(''),
        )

        
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.blue,
          ),
          routes: {
            MyHomePage.id: (context) => MyHomePage(),
            Login.id: (context) => Login(),
            SignUP.id:(context) => SignUP(),
            SelectLoginSignUp.id: (context) => SelectLoginSignUp(), 
            AddTodo.id: (context) => AddTodo(),
            Activities.id: (context) => Activities()
          },
          initialRoute: SelectLoginSignUp.id,
    ),);
  }
}
