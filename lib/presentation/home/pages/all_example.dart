import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../utils/utils.dart';

class AllRoutingExample extends HookConsumerWidget {
  static const route = '/allRoutingExample';
  final int id;
  final String name;
  final String age;
  const AllRoutingExample(
      {super.key, required this.id, required this.name, required this.age});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Routing Example'),
      ),
      body: Column(
        mainAxisAlignment: mainCenter,
        crossAxisAlignment: crossCenter,
        children: [
          Text('Id: $id'),
          Text('Name: $name'),
          Text('Age: $age'),
        ],
      ),
    );
  }
}
