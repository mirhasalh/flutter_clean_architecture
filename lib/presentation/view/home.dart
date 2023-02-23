import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/presentation/view_model/module.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO App Demo'),
      ),
      body: ref.watch(getTodosProvider).map(
            data: (todos) => ListView.separated(
              itemBuilder: (context, index) {
                var title = todos.value.values[index].title;
                return ListTile(title: Text(title));
              },
              separatorBuilder: (context, index) => const Divider(height: 0.0),
              itemCount: todos.value.values.length,
            ),
            error: (error) => Center(
              child: Text('${error.stackTrace}'),
            ),
            loading: (_) => const Center(child: CircularProgressIndicator()),
          ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.go('/add'),
        label: const Text('Add TODO'),
        icon: const Icon(Icons.add_rounded),
      ),
    );
  }
}
