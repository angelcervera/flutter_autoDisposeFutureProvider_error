import 'package:crud/common/other_widgets.dart';
import 'package:crud/todo/todo_model.dart';
import 'package:crud/todo/todo_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final todosStreamProvider = StreamProvider.autoDispose<List<Todo>>((ref) =>
    ref.watch(todoServiceProvider).list()
);

class ListApp extends ConsumerWidget {
  const ListApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todosAsyncVal = ref.watch(todosStreamProvider);
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: const Text('List')),
          body: todosAsyncVal.when(
            data: (todos) => ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, idx) => ListTile(title: Text(todos[idx].description!))
            ),
            loading: (_) => const CustomLoadingWidget(),
            error: (error, stackTrace, _) => ErrorWidget(error),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            tooltip: 'Add',
            child: const Icon(Icons.add),
          )
      )
    );
  }
}
