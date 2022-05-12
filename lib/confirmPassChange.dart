import 'package:flutter/material.dart';

class ConfirmPassChange extends StatelessWidget {
  const ConfirmPassChange({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ConfirmPassChangePage(title: 'LOGIN'),
    );
  }
}

class ConfirmPassChangePage extends StatefulWidget {
  const ConfirmPassChangePage({Key? key, required String title})
      : super(key: key);

  @override
  State<ConfirmPassChangePage> createState() => _ConfirmPassChangePageState();
}

class _ConfirmPassChangePageState extends State<ConfirmPassChangePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: const Text('LOGIN'),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[
              Color(0xFF92DA7F),
              Color(0xFF40BCA1),
            ],
          ),
        ),
      ),
    ));
  }
}
