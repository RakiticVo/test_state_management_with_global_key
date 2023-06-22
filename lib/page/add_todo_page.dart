import 'package:flutter/material.dart';
import 'package:test_state_management_by_global_key/model/todo_model.dart';

class AddToDoPage extends StatefulWidget {
  const AddToDoPage({super.key,});

  @override
  State<AddToDoPage> createState() => AddToDoPageState();
}

class AddToDoPageState extends State<AddToDoPage> {
  List<TodoModel> todos = [];
  final TextEditingController _textEditingController = TextEditingController();

  void addTodo() {
    setState(() {
      final title = _textEditingController.text;
      if (title.isNotEmpty) {
        todos.add(TodoModel(title, false));
        _textEditingController.clear();
      }
    });
  }

  void toggleTodoState(int index) {
    setState(() {
      todos[index].isCompleted = !todos[index].isCompleted;
    });
  }

  void removeTodo(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          TextField(
            controller: _textEditingController,
            decoration: const InputDecoration(
              labelText: 'Add Todo',
            ),
            onSubmitted: (_) => addTodo(),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return ListTile(
                  title: Text(todo.name),
                  leading: Checkbox(
                    value: todo.isCompleted,
                    onChanged: (_) => toggleTodoState(index),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => removeTodo(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}