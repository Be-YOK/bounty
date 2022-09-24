import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class RedeemPrize extends StatefulWidget {
  const RedeemPrize({Key? key}) : super(key: key);

  @override
  State<RedeemPrize> createState() => _RedeemPrizeState();
}

class _RedeemPrizeState extends State<RedeemPrize> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Redeem Prize'),
      ),
    );
  }
}
