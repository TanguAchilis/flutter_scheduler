import 'package:flutter/material.dart';
//var formattedDate = "${date.day}-${date.month}-${date.year}";

class AddTodo extends StatelessWidget {
  static String id='addTodo';
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

  _showDateTimePicker() async {
    selected = await showDatePicker(
      context: context,
      initialDatePickerMode: DatePickerMode.day,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(1960),
      lastDate: new DateTime(2050),
    );

    time = await showTimePicker(
       context: context,
       initialTime: TimeOfDay.now(),
    );


    print(selected);
    print(time);


    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
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
                ),
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
            TextFormField(
              decoration: InputDecoration(hintText: 'Activity'),
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'Place'),
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'Time'),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 10,
              child:   TextFormField(
                    readOnly: true,
                    //initialValue: time.toString(),
                    decoration: InputDecoration(
                      hintText: selected.toString(),
                      suffixIcon: IconButton(
                      
                    icon: Icon(Icons.calendar_today),
                    onPressed: _showDateTimePicker
                  )
                    ),

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
              child: Text('Add your Todo'),
            )
          ],
        ),
      ),
    );
  }
}
