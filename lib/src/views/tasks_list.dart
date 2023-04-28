import 'package:flutter/material.dart';

/// Displays detailed information about a SampleItem.
class TasksList extends StatelessWidget {
  const TasksList({super.key});

  static const routeName = '/sample_item';

  @override
  Widget build(BuildContext context) {
    final itemTemplate = Card(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Title(color: Colors.black, child: const Text("Title")),
      ),
    );

    return Expanded(
      child: ListView(
        children: [itemTemplate, itemTemplate, itemTemplate],
      ),
    );
  }
}
