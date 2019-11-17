import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_schedular/Pages/addTodo.dart';
import 'package:my_schedular/Providers/dataProvider.dart';
import 'package:my_schedular/components/activityItem.dart';
import 'package:provider/provider.dart';

Firestore _firestore = Firestore.instance;

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
    int count = 10;
    var provider = Provider.of<DataProvider>(context);
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
                            '${provider.readCounter} ' +
                                '/${provider.readTodoList.length} ' +
                                'Completed',
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
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      width: double.infinity,
                      //child: ExpansionList(),/
                      child: MessagesStream()
                      // Container(
                      //   //constraints: BoxConstraints(minHeight:MediaQuery.of(context).size.height/1.3, ),
                      //   height: MediaQuery.of(context).size.height / 1.3,
                      //   child: ListView.builder(
                      //     itemCount: provider.readTodoList.length,
                      //     itemBuilder: (BuildContext context, index) {
                      //       return ActivityItem(
                      //         activity: provider.readTodoList[index]
                      //             ['activity'],
                      //         time: provider.readTodoList[index]['time'],
                      //         category: provider.readTodoList[index]
                      //             ['category'],
                      //       );
                      //     },
                      //   ),
                      // ),
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

//this is where we are going to retrieve from our firestore using the streambuilder widget
class MessagesStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<DataProvider>(context);
    return StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('Task').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.lightBlueAccent,
              ),
            );
          }

          //the .reversed is used to return the messages in a reversed manner
          final tasks = snapshot.data.documents;
          for (var task in tasks) {
            provider.addTodo = {
              'activity': task.data['activity'],
              'time': task.data['time'],
              'category': task.data['category']
            };
            final messageText = task.data['text'];
            final messageSender = task.data['sender'];

            // final currentUser=loggedInUser.email;
            // if (currentUser==messageSender){

            // }

            // final messageBubble = MessageBubble(
            //   sender:messageSender,
            //   text: messageText,
            //   isMe: currentUser==messageSender
            // ,);

            // messageBubbles.add(messageBubble);
          }
          return Container(
            //constraints: BoxConstraints(minHeight:MediaQuery.of(context).size.height/1.3, ),
            height: MediaQuery.of(context).size.height / 1.3,
            child: ListView.builder(
              itemCount: provider.readTodoList.length,
              itemBuilder: (BuildContext context, index) {
                return ActivityItem(
                  changeVariable: (){provider.setCounter=1;},
                  activity: provider.readTodoList[index]['activity'],
                  time: provider.readTodoList[index]['time'],
                  category: provider.readTodoList[index]['category'],
                );
              },
            ),
          );
        });
  }
}
