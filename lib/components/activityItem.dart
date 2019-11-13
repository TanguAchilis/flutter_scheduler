import 'package:flutter/material.dart';
import 'package:my_schedular/Providers/dataProvider.dart';
import 'package:provider/provider.dart';

class ActivityItem extends StatefulWidget {
  ActivityItem(
      {this.activity, this.time, this.completedCounter, this.category});
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
                          ? provider.setCounter = 1
                          : provider.setCounter = 0;
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 37,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xffede7f6),
                ),
                child: showChild
                    ? Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        child: Text('' + widget.category))
                    : Container(
                        height: 0,
                      ),
              ),
              showChild
                  ? Expanded(
                      child: new CustomDropbutton(editFunction: (){print('edit');},deleteFunction: (){print('delete');},),
                    )
                  : Container(
                      width: 0,
                    )
            ],
          ),

          Divider()
        ],
      ),
    );
  }
}


//this code below is for the customdropdownbutton
class CustomDropbutton extends StatefulWidget {
  const CustomDropbutton({Key key, this.deleteFunction, this.editFunction})
      : super(key: key);

  final Function() deleteFunction;
  final Function() editFunction;

  @override
  _CustomDropbuttonState createState() => _CustomDropbuttonState();
}

class _CustomDropbuttonState extends State<CustomDropbutton> {
  bool showButton = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        !showButton
            ? GestureDetector(
                child: Icon(
                  Icons.more_horiz,
                  color: Color(0xff2962ff),
                ),
                onTap: () {
                  setState(() {
                    showButton = !showButton;
                  });
                },
              )
            : Container(
                width: 100,
                color: Color(0xff2962ff),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    GestureDetector(
                      child: Icon(
                        Icons.cancel,
                        color: Colors.white,
                      ),
                      onTap: () {
                        setState(() {
                          showButton = !showButton;
                        });
                      },
                    ),

                    //container acting as a divider
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white60),
                      ),
                      width: double.infinity,
                    ),

                    //container acting as a delete button
                    GestureDetector(
                      onTap: widget.deleteFunction,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            'Delete',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),

                    //container acting as a divider
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white60),
                      ),
                      width: double.infinity,
                    ),

                    //container acting as the edit button
                    GestureDetector(
                      onTap: widget.editFunction,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            'Edit',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
      ],
    );
  }
}
