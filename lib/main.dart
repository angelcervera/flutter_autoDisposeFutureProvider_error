import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/todo/add_view.dart';
import 'package:crud/todo/list_view.dart';
import 'package:crud/common/other_widgets.dart';
import 'package:crud/todo/todo_model.dart';
import 'package:crud/todo/todo_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseAppInit = FutureProvider<FirebaseApp>((ref) async {
  final appInit = await Firebase.initializeApp();
  FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
  return Future.value(appInit);
});

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firebaseInitialization = ref.watch(firebaseAppInit);
    return firebaseInitialization.when(
      data: (data) => const AddApp(),
      loading: (_) => const CustomLoadingApp(),
      error: (error, stackTrace, _) => CustomErrorApp(error: error.toString()),
    );
  }
}
