import 'package:flutter_clean_architecture/domain/model/todos.dart';
import 'package:flutter_clean_architecture/domain/repository/todos.dart';
import 'package:flutter_clean_architecture/domain/usecases/get_todos.dart';

class GetTodosUseCaseImpl extends GetTodosUseCase {
  GetTodosUseCaseImpl(this.todosRepository);

  final TodosRepository todosRepository;

  @override
  Future<Todos> execute() => todosRepository.loadTodos();
}
