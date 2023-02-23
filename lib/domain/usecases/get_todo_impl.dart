import '../model/todo.dart';
import '../repository/todos.dart';
import 'get_todo.dart';

class GetTodoUseCaseImpl extends GetTodoUseCase {
  GetTodoUseCaseImpl(this.todosRepository);

  final TodosRepository todosRepository;

  @override
  Future<Todo?> execute(int id) async => todosRepository.getTodoById(id);
}
