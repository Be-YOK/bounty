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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: snapshot.data!.size,
                    itemBuilder: (context, index) => Column(
                      children: [
                        Column(

                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(

                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Goal Name: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold, fontSize: 20, color: Colors.blue),
                                    ),
                                  ),
                                  Text(
                                    'child university savings',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold, fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              'Current',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15, color: Colors.grey),
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
              ),
            );
          }),
    );
  }
}
