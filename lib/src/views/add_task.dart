import 'package:daily/src/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
          hintText: 'Create new task',
          border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(Constants.borderRadius)))),
    );
  }
}
