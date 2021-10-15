import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'todo_model.freezed.dart';
part 'todo_model.g.dart';

@freezed
class Todo with _$Todo {
  factory Todo({ String? id, String? description }) = _Todo;

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
  factory Todo.fromJsonWithId(Map<String, dynamic> json, String documentId) =>
    _$TodoFromJson(json).copyWith(id:documentId);

}
