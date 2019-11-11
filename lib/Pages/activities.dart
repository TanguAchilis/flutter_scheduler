import 'package:flutter/material.dart';
import 'package:my_schedular/Pages/addTodo.dart';
import 'package:my_schedular/components/activityItem.dart';

class Activities extends StatelessWidget {
  final String date;
  Activities({this.date});
  static String id = 'activities';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        width: double.infinity,
        child: Row(
          children: <Widget>[
            IconButton(
              color: Color(0xff2962ff),
              iconSize: 30,
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.pushNamed(context, AddTodo.id);
              },
            ),
          ],
        ),
      ),
      body: new AcitiviesBody(date: date),
    );
  }
}

class AcitiviesBody extends StatelessWidget {
  const AcitiviesBody({
    Key key,
    @required this.date,
  }) : super(key: key);

  final String date;

  @override
  Widget build(BuildContext context) {
      int count=10;
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff2962ff),
      ),
      child: ListView(
        children: <Widget>[
          Hero(
            tag: 'upper',
            child: Container(
              height: MediaQuery.of(context).size.height / 8,
              padding: EdgeInsets.only(left: 7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '' + date,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Material(
                    color: Color(0xff2962ff),
                    child: IconButton(
                      color: Colors.white,
                      icon: Icon(Icons.more_horiz),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  )
                ],
              ),
            ),
          ),

          //this is the begining of the white box
          Hero(
            tag: 'home',
            child: Container(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).size.height / 6,
              ),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),

              //the main child of the white box which is a column
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    //the first child of the column which is a container showing the number of completed tasks
                    Container(
                      margin: EdgeInsets.only(
                        top: 10,
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                'All tasks',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18),
                              ),
                              IconButton(
                                padding: EdgeInsets.only(left: 0),
                                icon: Icon(Icons.expand_less),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              )
                            ],
                          ),
                          Text(
                            ' ' + ' ' + 'Completed',
                          )
                        ],
                      ),
                    ),

                    //the second child of the column is a container containing a divider
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      child: Divider(
                        color: Colors.grey.shade700,
                        thickness: 1,
                      ),
                    ),

                    //the last child of the column is a container which has a child of a listview builder
                    //infact this is the main part which holds all of the acitivities scheduled
                    Container(
                      margin: EdgeInsets.only(
                        top: 10,
                      ),
                      //color: Colors.red,
                      padding: EdgeInsets.only(left: 5, right: 20),
                      width: double.infinity,
                      child: ExpansionList(),
                      //child: ActivityItem(activity: 'Go show five girls how alpha i am ',time: '5:20 am',completedCounter: count,),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
