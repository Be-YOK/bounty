import 'package:flutter/material.dart';

class deposit extends StatefulWidget {
  const deposit({super.key});

  @override
  State<deposit> createState() => _depositState();
}

class _depositState extends State<deposit> {
  @override

  var amount;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Deposit')),
      body: Column(children: [
        TextField(
          onChanged: (val){
            amount = val;
        },
      ),
      ]),
    );
  }
}