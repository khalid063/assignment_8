

import 'package:assignment_8/style.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  final TextEditingController _titleInputController = TextEditingController();
  final TextEditingController _descriptionInputController = TextEditingController();
  final TextEditingController _daysRequiredInputController = TextEditingController();


  /// List of Task Manager
  List<Task> todos = [];

  /// Diolog Box code
  _myAlertDiolog(context) {
    return showDialog(
        context: context,
        builder: (BuildContext context){
          return Expanded(
              child: AlertDialog(
                title: Text("Add Task"),
                //content: Text("Do you want to delete"),
                content: Container(
                  height: 250,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: myInputDecoretion("Title"),
                        controller: _titleInputController,
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 3,                            /// For increase the height of textFormField
                        //maxLength: 5000,
                        decoration: myInputDecoretion("Discription"),
                        controller: _descriptionInputController,
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        decoration: myInputDecoretion("Days Required"),
                        controller: _daysRequiredInputController,
                      ),
                    ],
                  ),
                ),
                actions: [
                  TextButton(onPressed: (){
                    // _mySnackBar("Delete Succes", context);
                    todos.add(Task(_titleInputController.text.trim(), _descriptionInputController.text.trim(), _daysRequiredInputController.text.trim()));
                    setState(() {});
                    Navigator.of(context).pop();
                    print(todos[0].title);
                    _titleInputController.clear();
                    _descriptionInputController.clear();
                    _daysRequiredInputController.clear();
                  }, child: Text("Save")),
                ],
              )
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tast Management"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: todos.length,
          itemBuilder: (context, index){
            return ListTile(
              onLongPress: (){
                  /// on text start
                //showBottomSheet();
                Scaffold.of(context).showBottomSheet<void>(
                      (BuildContext context) {
                    return Container(
                      height: 200,
                      color: Colors.amber,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text("Task Details", style: myTextStyle(),),
                            Text("${todos[index].description}"),
                            ElevatedButton(
                                child: const Text('Delete'),
                                onPressed: () {
                                  setState(() {});
                                  Navigator.pop(context);
                                })
                          ],
                        ),
                      ),
                    );
                  },
                );
                /// on text end
              },
              title: Text("${todos[index].title}"),
              subtitle: Text("${todos[index].description}"),
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          _myAlertDiolog(context);
        },
      ),
    );
  }
}


class Task {

  String? title, description, daysRequired;

  Task(this.title, this.description, this.daysRequired);

}
