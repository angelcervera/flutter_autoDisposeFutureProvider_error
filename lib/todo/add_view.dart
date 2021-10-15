import 'package:crud/common/other_widgets.dart';
import 'package:crud/todo/todo_model.dart';
import 'package:crud/todo/todo_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final todoAddFutureProvider = FutureProvider/*.autoDispose*/.family<String, Todo>((ref, todo) {
//   return ref.read(todoServiceProvider).insert(todo);
// });

class AddApp extends StatelessWidget {
  const AddApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Add')),
        body: const _AddForm(),
      ),
    );
  }
}

class _AddForm extends ConsumerStatefulWidget {
  const _AddForm({Key? key}) : super(key: key);

  @override
  _AddFormState createState() => _AddFormState();
}

class _AddFormState extends ConsumerState<_AddForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _description = TextEditingController();

  @override
  void dispose() {
    _description.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: _formKey,
          child: Column(children: [
            TextFormField(
              controller: _description,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.description),
                  labelText: 'Description',
                  hintText: 'Description.'
              ),
              validator: (v) =>
                  (v == null || v.isEmpty) ? 'Name required' : null,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                direction: Axis.horizontal,
                spacing: 20,
                runSpacing: 20,
                children: [
                  Consumer(
                    builder: (context, watch, child) {
                      return ElevatedButton(
                        child: const Text('Submit'),
                        onPressed: _submit,
                      );
                    },
                  ),
                  ElevatedButton(
                    child: const Text('Cancel'),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {

      final todo = Todo(
        description: _description.text,
      );

      // showMessage(context, "Adding new todo.");
      ref
          // .read(todoAddFutureProvider(todo).future)
          .read(todoServiceProvider).insert(todo)
          .then((value) => showMessage(context, "Done"))
          .catchError((error) => showMessage(context, "Failed to update event: $error"));
    }
  }
}


