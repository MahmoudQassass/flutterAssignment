import 'package:assignment2/widgets/tasks.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabB extends StatefulWidget {
  @override
  _TabBState createState() => _TabBState();
}

class _TabBState extends State<TabB> {
  List<Task> allTasks = tasks;
  var txt_style =
      TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black);

  @override
  void initState() {
    super.initState();
    new TabB();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[600],
          title: Center(child: Text("Tasks")),
          bottom: TabBar(
            indicatorColor: Colors.red,
            tabs: [
              Tab(
                child: Text(
                  'All tasks',
                  style: txt_style,
                ),
              ),
              Tab(
                child: Text(
                  'Complete tasks',
                  style: txt_style,
                ),
              ),
              Tab(
                child: Text(
                  'InComplete tasks',
                  style: txt_style,
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: allTasks
                .map(
                  (e) => TasksWidget(
                    e,
                    onClick: callSetState,
                  ),
                )
                .toList(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: allTasks
                .where((e) => e.isComplete)
                .map(
                  (e) => TasksWidget(
                    e,
                    onClick: callSetState,
                  ),
                )
                .toList(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: allTasks
                .where((e) => !e.isComplete)
                .map(
                  (e) => TasksWidget(
                    e,
                    onClick: callSetState,
                  ),
                )
                .toList(),
          ),
        ]),
      ),
    );
  }

  void callSetState() {
    setState(
        () {}); // it can be called without parameters. It will redraw based on changes done in _SecondWidgetState
  }
}

class TasksWidget extends StatefulWidget {
  Task task;
  final Function onClick;
  TasksWidget(this.task, {this.onClick});

  @override
  _TasksWidgetState createState() => _TasksWidgetState();
}

class _TasksWidgetState extends State<TasksWidget> {
  Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.task.isComplete
          ? color = Colors.blue[100]
          : color = Colors.red[100],
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.task.title),
            Checkbox(
              value: widget.task.isComplete,
              onChanged: (value) {
                widget.task.isComplete = value;

                setState(() {
                  widget.onClick();
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
