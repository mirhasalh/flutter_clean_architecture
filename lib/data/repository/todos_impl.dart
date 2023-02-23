import 'dart:convert';

import 'package:flutter_clean_architecture/domain/model/todo.dart';
import 'package:flutter_clean_architecture/domain/repository/todos.dart';
import 'package:collection/collection.dart';

import '../../domain/model/todos.dart';
import '../source/files.dart';

class TodosRepositoryImpl extends TodosRepository {
  TodosRepositoryImpl(this.files);

  final Files files;
  late final String path = 'todos.json';

  @override
  Future<void> deleteAllTodos() async {
    await files.delete(path);
  }

  @override
  Future<void> deleteTodo(Todo todo) async {
    final todos = await loadTodos();

    // Delete the todos
    final newTodos = todos.values.where((t) => t.id != todo.id).toList();

    // Save the new list
    await files.write(path, jsonEncode(Todos(values: newTodos).toJson()));
  }

  @override
  Future<Todo?> getTodoById(int id) async {
    final todos = await loadTodos();

    // Find the todo by id
    return todos.values.firstWhereOrNull((todo) => todo.id == id);
  }

  @override
  Future<Todos> loadTodos() async {
    // Load the todos from path
    final content = await files.read(path);
    if (content == null) return const Todos(values: []);

    // Transform to the json and then return the list
    return Todos.fromJson(json.decode(content));
  }

  @override
  Future<void> saveTodo(Todo todo) async {
    final todos = await loadTodos();

    // Remove the todo from the list if it already exist
    final newTodo = todos.values.where((t) => t.id != todo.id).toList();

    // Add new todo
    newTodo.add(todo);

    // Save the new list
    await files.write(path, jsonEncode(Todos(values: newTodo).toJson()));
  }
}
