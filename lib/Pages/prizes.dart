import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../Extra_Pages/RedeemPrize.dart';
import '../backend_services/backend_services.dart';

backend_services backendServices = backend_services();

class prizes extends StatefulWidget {
  const prizes({Key? key}) : super(key: key);

  @override
  State<prizes> createState() => _prizesState();
}

class _prizesState extends State<prizes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      Text(
                        'Your Points: ' +
                            snapshot.data!.docs[index]
                                .data()['points']
                                .toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'iTunes 50 dollar card',
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
                            snapshot.data!.docs[index]
                                .data()['points_needed']
                                .toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => RedeemPrize()));
                          },
                          child: Text('Redeem'))
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
