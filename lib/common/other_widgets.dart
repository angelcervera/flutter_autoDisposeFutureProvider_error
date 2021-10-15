import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
    const Center(child: CircularProgressIndicator());
}

class CustomLoadingApp extends StatelessWidget {
  const CustomLoadingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loading......',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Loading......'),
        ),
        body: const CustomLoadingWidget(),
      ),
    );
  }
}

class CustomErrorWidget extends StatelessWidget {
  final String error;
  const CustomErrorWidget(this.error, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(child: Text('Error: $error'));

}

class CustomErrorApp extends StatelessWidget {

  final String error;
  const CustomErrorApp({required this.error, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Error......',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Error ......'),
        ),
        body: CustomErrorWidget(error)
      ),
    );
  }
}

void showMessage(BuildContext context, String message) {
  print(message);
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message))
  );
}
