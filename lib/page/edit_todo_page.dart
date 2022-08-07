import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:provider_todo_app/model/todo.dart';
import 'package:provider_todo_app/provider/todos.dart';
import 'package:provider_todo_app/widget/todo_form_widget.dart';


class EditTodoPage extends StatefulWidget {
  final Todo todo;

  const EditTodoPage({Key key, @required this.todo}) : super(key: key);

  @override
  _EditTodoPageState createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  final _formKey = GlobalKey<FormState>();

  String title;
  String description;

  @override
  void initState() {
    super.initState();
  
  //initial value of the title and description 
    title = widget.todo.title;
    description = widget.todo.description;
  }

  @override
  Widget build(BuildContext context) {
   return Consumer(builder:(context, ref, child) =>Scaffold(
        appBar: AppBar(
          title: Text('Edit Todo'),
          actions: [
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                final provider =
                    ref.read(todosProvider.notifier);
                provider.removeTodo(widget.todo);

                Navigator.of(context).pop();
              },
            )
          ],
        ),
        body:  Consumer (builder: (BuildContext context, WidgetRef ref, Widget child) { 
       return  Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
          
            child: TodoFormWidget(
              title: title,
              description: description,
              onChangedTitle: (title) => this.title = title,
              onChangedDescription: (description) =>
                   this.description = description),
            
            ),
          );
  })));
  }
  }
