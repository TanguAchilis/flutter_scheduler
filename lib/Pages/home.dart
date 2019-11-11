import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:my_schedular/Pages/activities.dart';

class MyHomePage extends StatefulWidget {
  static String id = 'home';
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime _currentDate;
  var _markedDateMap;
  String formatDate(DateTime date){
    var day;
    var month;
    switch(date.weekday){
      case 0:{day='Sunday';}
      break;
      case 1:{day='Monday';}
      break;
      case 2:{day='Tuesday';}
      break;
      case 3:{day='Wednesday';}
      break;
      case 4:{day='Thursday';}
      break;
      case 5:{day='Friday';}
      break;
      case 6:{day='Saturday';}
      break;
    }

    switch(date.month){
       case 1:{month='Jan';}
      break;
      case 2:{month ='Feb';}
      break;
      case 3:{month='Mar';}
      break;
      case 4:{month='Apr';}
      break;
      case 5:{month='May';}
      break;
      case 6:{month='Jun';}
      break;
       case 7 :{month='Jul';}
      break;
       case 8:{month='Aug';}
      break;
       case 9:{month='Sep';}
      break;
       case 10:{month='Oct';}
      break;
       case 11:{month='Nov';}
      break;
       case 12:{month='Dec';}
      break;
    }

    return "$day, ${date.day.toString()} $month";
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Container(
        color: Color(0xff2962ff),
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: <Widget>[
            Hero(
              tag: 'upper',
              child: Container(
                constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height -
                        MediaQuery.of(context).size.height / 2.7),
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: CalendarCarousel<Event>(
                  nextMonthDayBorderColor: Colors.teal,

                  onDayPressed: (DateTime date, List<Event> events) {
                    this.setState(() => _currentDate = date);
                    ///
                    ///
                    print(formatDate(date));
                  },
                  weekdayTextStyle: TextStyle(color: Colors.white),
                  weekendTextStyle: TextStyle(
                    color: Colors.white,
                  ),
                  daysTextStyle: TextStyle(color: Colors.white),
                  todayButtonColor: Colors.white,
                  todayTextStyle: TextStyle(
                      color: Color(0xff2962ff), fontWeight: FontWeight.w800),
                  todayBorderColor: Colors.transparent,
                  thisMonthDayBorderColor: Colors.transparent,
                  //      weekDays: null, /// for pass null when you do not want to render weekDays
                  //      headerText: Container( /// Example for rendering custom header
                  //        child: Text('Custom Header'),
                  //      ),
                  customDayBuilder: (
                    /// you can provide your own build function to make custom day containers
                    bool isSelectable,
                    int index,
                    bool isSelectedDay,
                    bool isToday,
                    bool isPrevMonthDay,
                    TextStyle textStyle,
                    bool isNextMonthDay,
                    bool isThisMonthDay,
                    DateTime day,
                  ) {
                    /// If you return null, [CalendarCarousel] will build container for current [day] with default function.
                    /// This way you can build custom containers for specific days only, leaving rest as default.

                    // Example: every 15th of month, we have a flight, we can place an icon in the container like that:
                    if (day.day == 15) {
                      return Center(
                        child: Icon(Icons.local_airport),
                      );
                    } else {
                      return null;
                    }
                  },
                  weekFormat: false,
                  markedDatesMap: _markedDateMap,
                  height: 420.0,
                  selectedDateTime: _currentDate,
                  daysHaveCircularBorder: true,

                  /// null for not rendering any border, true for circular border, false for rectangular border
                ),
              ),
            ),
            Hero(
              tag: 'home',
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 3),
                constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height / 3),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Activities(date: formatDate(_currentDate),)));
                      },
                      child: Center(child: new ExpandScreen()),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, ),
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
                                icon: Icon(Icons.expand_more),
                                onPressed: () {
                                  //Navigator.pushNamed(context, Activities.id);
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context)=>Activities(date:formatDate(_currentDate)),
                                  ));
                                },
                              )
                            ],
                          ),

                          Text(' '+' '+'Completed')
                        ],
                      ),
                    ),

                    Container(padding: EdgeInsets.only(left:20),
                    child: Divider(
                      color: Colors.grey.shade700,
                      thickness: 1,
                    ),)

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ExpandScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 5),
        Container(
          width: MediaQuery.of(context).size.width / 2.5,
          decoration:
              BoxDecoration(border: Border.all(color: Colors.grey.shade300)),
        ),
        SizedBox(height: 2),
        Container(
          width: MediaQuery.of(context).size.width / 2.5,
          decoration:
              BoxDecoration(border: Border.all(color: Colors.grey.shade300)),
        ),
      ],
    );
  }
}
