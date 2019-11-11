import 'package:flutter/material.dart';

class ActivityItem extends StatefulWidget {
  ActivityItem({this.activity, this.time, this.completedCounter});
  int completedCounter;
  final String activity;
  final String time;
  @override
  _ActivityItemState createState() => _ActivityItemState();
}

class _ActivityItemState extends State<ActivityItem> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child:ExpansionTile(
        title: Row(
          children: <Widget>[
            
          ],
        ),
      ) 
      /*Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Checkbox(
            checkColor: Colors.white,
            activeColor: Color(0xff2962ff),
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = value;
                isChecked
                    ? widget.completedCounter = widget.completedCounter + 1
                    : widget.completedCounter = widget.completedCounter;
                if (widget.completedCounter >= 0 && isChecked == false) {
                  widget.completedCounter -= 1;
                }
                print(widget.completedCounter);
              });
            },
          ),
          Expanded(
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
          )
        ],
      ),*/
    );
  }
}

class ExpansionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ExpansionTile(
        title: Text('I love you'),
        children: <Widget>[
          Container(
            color: Colors.red,
            width: 200,
            height: 100,
          )
        ],
        trailing: Text('8:15 am'),
      ),
    );
  }
}

/*class _ActivityItemState extends State<ActivityItem> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Checkbox(
            checkColor: Colors.white,
            activeColor: Color(0xff2962ff),
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = value;
                isChecked? widget.completedCounter=widget.completedCounter+1:widget.completedCounter=widget.completedCounter;
                if(widget.completedCounter>=0 && isChecked==false){widget.completedCounter-=1;}
                print(widget.completedCounter);
              });
            },
          ),

          Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(child: Text(' '+widget.activity, style: TextStyle(decoration: isChecked? TextDecoration.lineThrough:TextDecoration.none),)),
                //SizedBox(width: 5,),
                Text(' '+widget.time, style: TextStyle(decoration: isChecked? TextDecoration.lineThrough:TextDecoration.none)),

              ],
            ),
          )
        ],
      ),
    );
  }
}*/
