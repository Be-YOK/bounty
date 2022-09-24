import 'package:bounty/Pages/home.dart';
import 'package:bounty/backend_services/backend_services.dart';
import 'package:flutter/material.dart';

backend_services backendServices = backend_services();

class deposit extends StatefulWidget {
  const deposit(
      {required this.id,
      required this.name,
      required this.points,
      required this.wallet_amount});

  final String id;
  final String name;
  final double wallet_amount;
  final int points;

  @override
  State<deposit> createState() => _depositState(
      id: id, name: name, wallet_amount: wallet_amount, points: points);
}

class _depositState extends State<deposit> {
  String id;
  String name;
  double wallet_amount;
  int points;

  _depositState(
      {required this.id,
      required this.name,
      required this.points,
      required this.wallet_amount});

  var amount;

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
                await backendServices.deposit(
                    id, name, wallet_amount, points, double.parse(amount));
                    Navigator.pop(context);
              },
              child: Text('Deposit'))
        ]),
      ),
    );
  }
}
