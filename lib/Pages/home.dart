import 'package:bounty/Extra_Pages/Deposit.dart';
import 'package:bounty/Extra_Pages/Withdraw.dart';
import 'package:bounty/Pages/prizes.dart';
import 'package:bounty/backend_services/backend_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:bounty/Pages/prizes.dart';

backend_services backendServices = backend_services();

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: backendServices.getUserInfo('2Ai3frjBnb0FF3Pr4yUm'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            return SafeArea(
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ListView.builder(
                    itemCount: snapshot.data!.size,
                    itemBuilder: (context, index) => Column(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/bounty_logo.png', height: 100,),
                            Text(
                              'Your Savings',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20, color: Colors.blue),
                            ),
                            Text(
                              '${snapshot.data!.docs[index].data()['wallet_amount'].toString()} KD',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                            Container(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => deposit(
                                                  id: snapshot.data!.docs[index]
                                                      .data()['id'],
                                                  name: snapshot
                                                      .data!.docs[index]
                                                      .data()['name'],
                                                  wallet_amount: snapshot
                                                      .data!.docs[index]
                                                      .data()['wallet_amount'],
                                                  points: snapshot
                                                      .data!.docs[index]
                                                      .data()['points'],
                                                )),
                                      );
                                    },
                                    child: Text('Deposit')),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => withdraw(
                                                  id: snapshot.data!.docs[index]
                                                      .data()['id'],
                                                  name: snapshot
                                                      .data!.docs[index]
                                                      .data()['name'],
                                                  wallet_amount: snapshot
                                                      .data!.docs[index]
                                                      .data()['wallet_amount'],
                                                  points: snapshot
                                                      .data!.docs[index]
                                                      .data()['points'],
                                                )),
                                      );
                                    }, child: Text('Withdraw'))
                              ],
                            ),
                            Container(
                              height: 20,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Your Points',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20, color: Colors.blue),
                            ),
                            Text(
                              '${snapshot.data!.docs[index].data()['points'].toString()} points',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
