import 'package:flutter/material.dart';
import 'package:my_schedular/Providers/dataProvider.dart';
import 'package:provider/provider.dart';

class ActivityItem extends StatefulWidget {
  ActivityItem({this.activity, this.time, this.completedCounter, this.category});
  int completedCounter;
  final String activity;
  final String time;
  final String category;
  @override
  _ActivityItemState createState() => _ActivityItemState();
}

class _ActivityItemState extends State<ActivityItem> {
  bool isChecked = false;
  bool showChild = false;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<DataProvider>(context);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 20),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //
              //below is the custom checkbox
              //
              Padding(
                padding: const EdgeInsets.only(right: 17),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isChecked = !isChecked;
                      isChecked
                          ?  provider.setCounter=1
                          : provider.setCounter=0;
                      if (provider.readCounter >= 0 && isChecked == false) {
                        provider.setCounter = -1;
                      }
                      print(provider.readCounter);
                    });
                  },
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade800),
                        color:
                            isChecked ? Color(0xff2962ff) : Colors.transparent),
                    child: Center(
                      child: isChecked
                          ? Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 18,
                            )
                          : Container(
                              height: 0,
                            ),
                    ),
                  ),
                ),
              ),

              //this is for the activity and time
              ///////////////////////////////////
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      showChild = !showChild;
                    });
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                          child: Text(
                        ' ' + widget.activity,
                        style: TextStyle(
                            decoration: isChecked
                                ? TextDecoration.lineThrough
                                : TextDecoration.none),
                      )),
                      //SizedBox(width: 5,),
                      Text(' ' + widget.time,
                          style: TextStyle(
                              decoration: isChecked
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none)),
                    ],
                  ),
                ),
              )
            ],
          ),

          ///here is the child that will be shown once the text is clicked
          //////////////////////////////////////////////////
          Row(
            children: <Widget>[
              SizedBox(width: 37,),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xffede7f6),
                ),
                child: showChild
                    ? Container(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),child:Text(''+widget.category))
                    : Container(
                        height: 0,
                      ),
              ),
            ],
          ),

          Divider()
        ],
      ),
    );
  }
}

