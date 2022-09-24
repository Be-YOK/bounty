import 'package:bounty/backend_services/backend_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../Extra_Pages/addGoals.dart';

backend_services backendServices = backend_services();

class goals extends StatefulWidget {
  const goals({Key? key}) : super(key: key);

  @override
  State<goals> createState() => _goalsState();
}

class _goalsState extends State<goals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: backendServices.getAllGoals('iXwSksiXhsHf7RmpaL1J'),
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Goal: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Text(
                                snapshot.data!.docs[index].data()['id'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ],
                          ),
                          Text(
                            "Active: " +
                                snapshot.data!.docs[index]
                                    .data()['is_active']
                                    .toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ],
                      ),
                      Divider(),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => addGoals()));
                          },
                          child: Text('Add Goal'))
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
