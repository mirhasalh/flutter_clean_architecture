import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/model/todos.dart';
import '../../domain/usecases/module.dart';

part 'module.g.dart';

@riverpod
Future<Todos> todosList(TodosListRef ref) async {
  final usecase = ref.watch(getTodosProvider);
  final items = await usecase.execute();
  return items;
}

class TodoStateNotifier extends StateNotifier<Todos> {
  TodoStateNotifier(this.ref) : super(const Todos(values: [])) {
    loadTodos();
  }

  final Ref ref;

  late final getTodos = ref.read(getTodosProvider);

  Future<void> loadTodos() async {
    state = await getTodos.execute();
  }
}

final todosListState = StateNotifierProvider<TodoStateNotifier, Todos>(
    (ref) => TodoStateNotifier(ref));

final todosListModel = Provider<TodoStateNotifier>((ref) {
  return ref.watch(todosListState.notifier);
});
