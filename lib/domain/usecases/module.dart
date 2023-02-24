import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repository/module.dart';
import 'usecases.dart';

final getTodosProvider = Provider<GetTodosUseCase>((ref) {
  return GetTodosUseCaseImpl(ref.read(todosProvider));
});

final getTodoProvider = Provider<GetTodoUseCase>((ref) {
  return GetTodoUseCaseImpl(ref.read(todosProvider));
});

final saveTodoProvider = Provider<SaveTodoUseCase>((ref) {
  return SaveTodoUseCaseImpl(ref.read(todosProvider));
});

final deleteTodoProvider = Provider<DeleteTodoUseCase>((ref) {
  return DeleteTodoUseCaseImpl(ref.read(todosProvider));
});
