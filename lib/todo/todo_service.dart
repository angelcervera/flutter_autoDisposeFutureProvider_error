import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/common/dao.dart';
import 'package:crud/todo/todo_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final todoServiceProvider = Provider<TodoFirestoreDatabase>((ref) {
  return TodoFirestoreDatabase();
});

class TodoFirestoreDatabase implements DAO<Todo> {

  static TodoFirestoreDatabase get instance => TodoFirestoreDatabase();

  static const String _collection = 'todo';

  @override
  Future<void> delete(String id) {
    throw UnimplementedError();
  }

  @override
  Future<String> insert(Todo entity) async =>
      (
        await FirebaseFirestore.instance
        .collection(_collection)
        .add(entity.toJson())
      ).id;

  @override
  Stream<List<Todo>> list() =>
    FirebaseFirestore.instance
        .collection(_collection)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs
              .map((snapshot) => Todo.fromJsonWithId(snapshot.data(), snapshot.id))
              .toList()
        );

  @override
  Future<Todo> retrieve(String id) {
    throw UnimplementedError();
  }

  @override
  Stream<Todo> retrieveStream(String id) {
    throw UnimplementedError();
  }

  @override
  Future<void> update(Todo entity) {
    throw UnimplementedError();
  }

  @override
  Future<void> upsert(Todo entity) {
    throw UnimplementedError();
  }

}



