import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class QueryparameterScreen extends HookConsumerWidget {
  static const route = '/queryParameterScreen';
  final int id;
  final String name;
  const QueryparameterScreen({super.key, required this.id, required this.name});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Queryparameter Screen'),
      ),
      body: Center(
        child: Text('QueryparameterScreen: $id, $name'),
      ),
    );
  }
}
