import 'package:bounty/Pages/prizes.dart';
import 'package:bounty/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../backend_services/backend_services.dart';

backend_services backendServices = backend_services();

class RedeemPrize extends StatefulWidget {
  const RedeemPrize({Key? key}) : super(key: key);

  @override
  State<RedeemPrize> createState() => _RedeemPrizeState();
}

int x = 600;

class _RedeemPrizeState extends State<RedeemPrize> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Prize Redeem')),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: backendServices.getPrizes(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            return SafeArea(
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: ListView.builder(
                  itemCount: snapshot.data!.size,
                  itemBuilder: (context, index) => Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Your Points: $x',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Image.network(
                          snapshot.data!.docs[index].data()['image_url'],
                          height: 200.0),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Prize Points: ' +
                            snapshot.data!.docs[index].data()['description'],
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Prize Points: 270',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              x = x - 270;
                            });
                          },
                          child: Text('Redeem Points'))
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
