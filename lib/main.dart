import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sqflite/sqflite.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Task Manager'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          Slidable(
            delegate: new SlidableDrawerDelegate(),
            actionExtentRatio: 0.25,
            child: new Container(
              color: Colors.white,
              child: new ListTile(
                leading: Checkbox(value: false, onChanged: null),
                title: new Text("task 1"),
              ),
            ),
            secondaryActions: <Widget>[
              new IconSlideAction(
                caption: 'More',
                color: Colors.blue,
                icon: Icons.edit,
                onTap: () => _showSnackBar('Edit'),
              ),
              new IconSlideAction(
                caption: 'Delete',
                color: Colors.red,
                icon: Icons.delete,
                onTap: () => _showSnackBar('Delete'),
              ),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        child: Icon(Icons.add),
        onPressed: newTask,
      ),
    );
  }

  void newTask() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Create New Task"),
            content: TextField(),
            actions: <Widget>[
              FlatButton(
                child: Text("Cancel"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              RaisedButton(
                child: Text("Save"),
                onPressed: _showSnackBar('Created succesfully'),
              ),
            ],
          );
        });
  }

  _showSnackBar(String text) {
    Scaffold.of(context).showSnackBar( new SnackBar(
      duration: const Duration(seconds: 1),
      content: Text(text),
      backgroundColor: Colors.green[600],
    ));
  }
}
