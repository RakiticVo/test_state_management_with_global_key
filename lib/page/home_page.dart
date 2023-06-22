import 'package:flutter/material.dart';
import 'package:test_state_management_by_global_key/page/add_todo_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final GlobalKey<AddToDoPageState> _todoAppStateKey = GlobalKey<AddToDoPageState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Todo App with Global key management',
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
      ),
      body: AddToDoPage(key: _todoAppStateKey),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_todoAppStateKey.currentState != null) {
            _todoAppStateKey.currentState!.addTodo();
          }
        },
        child: const Icon(Icons.add, size: 40.0,),
      ),
    );
  }
}