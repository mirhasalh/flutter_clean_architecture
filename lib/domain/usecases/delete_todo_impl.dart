import '../model/todo.dart';
import '../repository/todos.dart';
import 'delete_todo.dart';

class DeleteTodoUseCaseImpl extends DeleteTodoUseCase {
  DeleteTodoUseCaseImpl(this.todosRepository);

  final TodosRepository todosRepository;

  @override
  Future<void> execute(Todo todo) async {
    await todosRepository.deleteTodo(todo);
  }
}
