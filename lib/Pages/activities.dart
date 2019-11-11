import 'package:flutter/material.dart';
import 'package:my_schedular/Pages/addTodo.dart';

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
              onPressed: (){Navigator.pushNamed(context, AddTodo.id);},
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
                  ''+date,
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
          Hero(
            tag: 'home',
            child: Container(
              height: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).size.height / 6,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Column(
                children: <Widget>[
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
                        Text(' ' + ' ' + 'Completed',)
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Divider(
                      color: Colors.grey.shade700,
                      thickness:1,
                    ),
                  ),


                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
