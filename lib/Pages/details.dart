import 'package:bounty/backend_services/backend_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

backend_services backendServices = backend_services();

class details extends StatefulWidget {
  const details({Key? key}) : super(key: key);

  @override
  State<details> createState() => _detailsState();
}

class _detailsState extends State<details> {
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
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ListView.builder(
                    itemCount: snapshot.data!.size,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(DateTime.now().toString(), style: TextStyle(color: Colors.grey),),
                          Text(snapshot.data!.docs[index].data()['name'], style: TextStyle(fontSize: 20),),
                          Image.network(snapshot.data!.docs[index].data()['image_url'], height: 225,)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
