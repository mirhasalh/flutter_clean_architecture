import 'package:flutter_clean_architecture/domain/model/todo.dart';

import '../model/todos.dart';

abstract class TodosRepository {
  Future<Todos> loadTodos();

  Future<void> saveTodo(Todo todo);

  Future<void> deleteTodo(Todo todo);

  Future<void> deleteAllTodos();

  Future<Todo?> getTodoById(int id);
}
