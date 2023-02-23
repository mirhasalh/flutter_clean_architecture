import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repository/module.dart';
import 'get_todos.dart';
import 'get_todos_impl.dart';

final getTodosProvider = Provider<GetTodosUseCase>((ref) {
  return GetTodosUseCaseImpl(ref.read(todosProvider));
});
