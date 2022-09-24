import 'package:flutter/material.dart';

import '../backend_services/backend_services.dart';
backend_services backendServices = backend_services();
class withdraw extends StatefulWidget {
  const withdraw(
      {required this.id,
      required this.name,
      required this.points,
      required this.wallet_amount});

  final String id;
  final String name;
  final double wallet_amount;
  final int points;

  @override
  State<withdraw> createState() => _withdrawState(id: id, name: name, wallet_amount: wallet_amount, points: points);
}

class _withdrawState extends State<withdraw> {

  var amount;

  String id;
  String name;
  double wallet_amount;
  int points;

  _withdrawState(
      {required this.id,
      required this.name,
      required this.points,
      required this.wallet_amount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Deposit')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Text(
            'Amount',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 20),
          ),
          TextField(
            onChanged: (val) {
              amount = val;
            },
          ),
          Container(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () async {
                await backendServices.withdraw(
                    id, name, wallet_amount, points, double.parse(amount));
                    Navigator.pop(context);
              },
              child: Text('Withdraw'))
        ]),
      ),
    );;
  }
}