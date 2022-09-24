import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class addGoals extends StatefulWidget {
  const addGoals({Key? key}) : super(key: key);

  @override
  State<addGoals> createState() => _addGoalsState();
}

class _addGoalsState extends State<addGoals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add Goals'),
      ),
    );
  }
}
