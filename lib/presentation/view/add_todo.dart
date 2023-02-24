import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/presentation/view_model/module.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shortid/shortid.dart';

import '../../domain/model/todo.dart';
import '../../domain/usecases/module.dart';

class AddTodo extends ConsumerStatefulWidget {
  const AddTodo({super.key});

  @override
  ConsumerState<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends ConsumerState<AddTodo> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  bool _completed = false;

  late final _saveTodo = ref.read(saveTodoProvider);
  late final _todoList = ref.read(todosListModel);

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add TODO'),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              children: [
                TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                  ),
                ),
                TextField(
                  controller: _descController,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                  ),
                ),
                CheckboxListTile(
                  value: _completed,
                  onChanged: (value) {
                    setState(() => _completed = value!);
                  },
                  title: const Text('Completion'),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();

            final todo = Todo(
              id: shortid.generate(),
              title: _titleController.text,
              desc: _descController.text,
              completed: _completed,
            );

            final router = GoRouter.of(context);

            final messanger = ScaffoldMessenger.of(context);

            await _saveTodo.execute(todo);

            messanger.toast('Todo saved');

            await _todoList.loadTodos();

            if (router.canPop()) router.pop();
          }
        },
        label: const Text('Save'),
        icon: const Icon(Icons.save_rounded),
      ),
    );
  }
}

extension on ScaffoldMessengerState {
  void toast(String message) {
    showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
