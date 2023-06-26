

import 'package:assignment_8/style.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

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
                  height: 300,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: myInputDecoretion("Title"),
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 5,
                        //maxLength: 5000,
                        decoration: myInputDecoretion("Discription"),
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        decoration: myInputDecoretion("Days Required"),
                      ),
                    ],
                  ),
                ),
                actions: [
                  TextButton(onPressed: (){
                    // _mySnackBar("Delete Succes", context);
                    Navigator.of(context).pop();
                  }, child: Text("Yes")),
                  TextButton(onPressed: (){
                    Navigator.of(context).pop();
                  }, child: Text("No"))
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
      body: Container(
        child: Center(
          child: Text("Body Part"),
        ),
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
