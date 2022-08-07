import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import 'package:provider_todo_app/provider/todos.dart';
import 'package:provider_todo_app/widget/todo_widget.dart';


class CompletedListWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context,  WidgetRef ref) {
      
    final provider = ref.read(todosProvider.notifier);
    final todos = provider.todosCompleted;

    return todos.isEmpty
        ? Center(
            child: Text(
              'No completed tasks.',
              style: TextStyle(fontSize: 20),
            ),
          )
        : ListView.separated(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(16),
            separatorBuilder: (context, index) => Container(height: 8),
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];

              return TodoWidget(todo: todo);
            },
          );
  }
}
