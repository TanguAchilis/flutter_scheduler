import 'package:flutter/material.dart';
import 'package:my_schedular/Providers/dataProvider.dart';
import 'package:provider/provider.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

Firestore _firestore = Firestore.instance;
//var formattedDate = "${date.day}-${date.month}-${date.year}";

class AddTodo extends StatelessWidget {
  static String id = 'addTodo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  var selected;
  var time;
  var formatedTime;
  String category;
  String activity;

  _showDateTimePicker() async {
    // selected = await showDatePicker(
    //   context: context,
    //   initialDatePickerMode: DatePickerMode.day,
    //   initialDate: new DateTime.now(),
    //   firstDate: new DateTime(1960),
    //   lastDate: new DateTime(2050),
    // );

    time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (time.hour > 12) {
      formatedTime =
          (time.hour - 12).toString() + ':' + time.minute.toString() + ' pm';
    } else if (time.hour < 12 && time.hour > 0) {
      formatedTime =
          (time.hour).toString() + ':' + time.minute.toString() + ' am';
    } else if (time.hour == 12) {
      formatedTime =
          (time.hour).toString() + ':' + time.minute.toString() + ' pm';
    } else if (time.hour == 0) {
      formatedTime =
          (time.hour + 12).toString() + ':' + time.minute.toString() + ' am';
    }

    print(selected);
    print(formatedTime);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<DataProvider>(context);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width / 15),
        decoration: BoxDecoration(color: Color(0xffffffff)),
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.keyboard_backspace),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                Text(
                  'Add new Todo',
                  style: TextStyle(),
                ),
                IconButton(
                  icon: Icon(Icons.tune),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.fromLTRB(
                  0,
                  MediaQuery.of(context).size.height / 30,
                  0,
                  MediaQuery.of(context).size.height / 15),
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(50)),
                  child: Icon(Icons.border_color),
                ),
              ),
            ),

            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Center(
                child: Text(
                  'hello',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              decoration: BoxDecoration(
                color: Color(0xff2962ff),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
            ),

            ////
            ///this is where the fields for data input start coming in
            ///
            TextFormField(
              decoration: InputDecoration(labelText: 'Activity'),
              onChanged: (value) {
                activity = value;
              },
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Text('Time')
              ],
            ),
            TextFormField(
              //initialValue: time.hour.toString(),
              readOnly: true,
              decoration: InputDecoration(
                //labelText: 'Time',
                hintText: formatedTime,

                suffixIcon: IconButton(
                    icon: Icon(Icons.access_time),
                    onPressed: _showDateTimePicker),
              ),
            ),

            //this is the label to the dropdown button
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Text('Category')
              ],
            ),
            DropdownButtonFormField(
              onChanged: (value) {
                setState(() {
                  category = value;
                });
              },
              items: [
                DropdownMenuItem(
                  value: 'Travel',
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Travel'),
                        ],
                      ),
                      Divider()
                    ],
                  ),
                ),
                DropdownMenuItem(
                  value: 'School work',
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('School work'),
                        ],
                      ),
                      Divider()
                    ],
                  ),
                ),
                DropdownMenuItem(
                  value: 'Personal development',
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Personal development'),
                        ],
                      ),
                      Divider()
                    ],
                  ),
                ),
                DropdownMenuItem(
                  value: 'leisure',
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('leisure'),
                        ],
                      ),
                      Divider()
                    ],
                  ),
                ),
                DropdownMenuItem(
                  value: 'Others',
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Others'),
                    ],
                  ),
                ),
              ],
              decoration: InputDecoration(
                /*labelText: 'Category',*/ hintText: category,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 10,
              child: TextFormField(
                readOnly: true,
                //initialValue: time.toString(),
                decoration: InputDecoration(
                    hintText: selected.toString(),
                    suffixIcon: IconButton(
                        icon: Icon(Icons.calendar_today),
                        onPressed: _showDateTimePicker)),
              ),
              // child: Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: <Widget>[
              //     // Text(''+selected.toString()),
              //     // IconButton(
              //     //   icon: Icon(Icons.calendar_today),
              //     //   onPressed: _showDateTimePicker
              //     // )
              //     TextFormField(
              //       readOnly: true,

              //     )
              //   ],
              // ),
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'Notification'),
            ),
            RaisedButton(
              onPressed: () {
                provider.addTodo = {
                  'activity': activity,
                  'time': formatedTime,
                  'category': category
                };
                Navigator.pop(context);
                Map<String,String> certDataMap = {
                  'activity': activity,
                  'time': formatedTime,
                  'category': category
                };
                _firestore
                    .collection('Task')
                    .add(certDataMap)
                    .then((DocumentReference docRef) {
                  _firestore
                      .collection('Task')
                      .document(docRef.documentID)
                      .updateData({'certId': docRef.documentID}).then((_) {
                    _firestore
                        .collection('Users')
                        .document('HVtQSXHcshSHY35oWLtb')
                        .collection('UserTask')
                        .document(docRef.documentID)
                        .setData({'taskid': docRef.documentID});
                  });
                }).then((_){print('success');});
              },
              color: Color(0xff2962ff),
              child: Text(
                'Add your Todo',
                style: TextStyle(color: Colors.white),
              ),
              padding: EdgeInsets.symmetric(vertical: 13),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
