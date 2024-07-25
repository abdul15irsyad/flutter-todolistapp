import 'package:flutter/material.dart';
import 'package:todolistapp/models/task.dart';

class HomeScreen extends StatefulWidget {
  // const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> _todoList = [
    // Task(text: 'beli susu'),
    // Task(text: 'ngoding flutter'),
    // Task(text: 'bayar internet'),
    // Task(text: 'nonton playoffs'),
  ];

  String _input = '';
  void _addTaskHandler() {
    if (_input.isNotEmpty) {
      setState(() {
        _todoList.add(Task(text: _input));
      });
      _input = '';
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Todo List App'),
          brightness: Brightness.dark,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Add Task'),
                    content: TextField(
                      onChanged: (String value) {
                        // _input = value;
                      },
                      onSubmitted: (String value) {
                        _addTaskHandler();
                      },
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            _addTaskHandler();
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Theme.of(context).primaryColor)),
                          child: Text(
                            'Add',
                            style: TextStyle(color: Colors.white),
                          )),
                    ],
                  );
                });
          },
          child: Icon(Icons.add),
        ),
        body: _todoList.length > 0
            ? ListView.builder(
                itemCount: _todoList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),
                    child: Card(
                        child: ListTile(
                            title: Text(
                              _todoList[index].text,
                              style: TextStyle(
                                  decoration: _todoList[index].status
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none),
                            ),
                            trailing: _todoList[index].status
                                ? IconButton(
                                    color: Theme.of(context).primaryColor,
                                    onPressed: () {
                                      _todoList.removeAt(index);
                                      setState(() {
                                        _todoList = _todoList;
                                      });
                                    },
                                    icon: Icon(Icons.delete))
                                : IconButton(
                                    color: Colors.green[300],
                                    onPressed: () {
                                      setState(() {
                                        _todoList[index].status =
                                            !_todoList[index].status;
                                      });
                                    },
                                    icon: Icon(Icons.check),
                                  ))),
                  );
                },
              )
            : Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 100.0, 0, 0),
                  child: Column(
                    children: [
                      Image(
                        image: AssetImage('assets/images/empty.png'),
                        height: 250.0,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.amber[100],
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 15.0),
                        child: Text('Yeay... your all task is done!',
                            style: TextStyle(
                                fontSize: 20.0, color: Colors.grey[800])),
                      )
                    ],
                  ),
                ),
              ));
  }
}
