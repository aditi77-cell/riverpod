import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_todo_app/model/todo.dart';
import 'package:provider_todo_app/provider/todos.dart';

 class TodoFormWidget extends ConsumerWidget {
  final String title;
  final String description;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
 
  TodoFormWidget({
    Key key,
    this.title = '',
    this.description = '',
    @required this.onChangedTitle,
    @required this.onChangedDescription,
   
  }) : super(key: key);
final _formKey = GlobalKey<FormState>();
  

  Widget build(BuildContext context,WidgetRef ref)
  { return  SingleChildScrollView(
    child:Form(
          // form key is used for validations 
          key: _formKey,
          
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

       //Textfromfield for title     
            TextFormField(
            initialValue: title,
        maxLines: 1,
       
        onChanged: onChangedTitle,
        validator: (title) {
          if (title.isEmpty) {
            return 'The title cannot be empty';
          }
          return null;
        },
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Title',
        ),
      ),
            SizedBox(height: 8),

         //Textformfeild for the description    
            TextFormField(
        maxLines: 3,
        initialValue: description,
        onChanged: onChangedDescription,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Description',
        ),
      ),

            SizedBox(height: 16),

            // button for save the information 
             SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue),
          ),
          onPressed: (){
            final isValid = _formKey.currentState.validate();

    if (!isValid) {
      return;
    } else {
      final todo = Todo(
        title: title,
        description: description,
       
      );

      // add list of list
      
            
           ref.read (todosProvider.notifier).addTodo(todo);
     
      //listen is set false,
      //it won't cause this widget to rebuild when notifyListener is called
          
      Navigator.of(context).pop();
    }

          },
          child: Text('Save'),
        ),
      ),
          ],
        ),
      ));

  }
  
 
}