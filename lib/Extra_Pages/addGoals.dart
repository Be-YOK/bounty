import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class addGoals extends StatefulWidget {
  const addGoals({Key? key}) : super(key: key);

  @override
  State<addGoals> createState() => _addGoalsState();
}

class _addGoalsState extends State<addGoals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add Goals'),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Enter Goal Name',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all()),
                  child: TextFormField(
                      onChanged: (value) {},
                      decoration:
                          const InputDecoration(border: InputBorder.none)),
                ),
                Container(height: 10),
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Enter amount',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all()),
                  child: TextFormField(
                      onChanged: (value) {},
                      decoration:
                          const InputDecoration(border: InputBorder.none)),
                ),
                Container(height: 10),
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Enter Time',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all()),
                  child: TextFormField(
                      onChanged: (value) {},
                      decoration:
                          const InputDecoration(border: InputBorder.none)),
                ),
                Container(height: 10),
                ElevatedButton(onPressed: () {}, child: Text('Save'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}


// Container(
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(8.0),
//                                     border: Border.all()),
//                                 child: TextFormField(
//                                     onChanged: (value) {
//                                       data[index] = value;
//                                     },
//                                     decoration: const InputDecoration(
//                                         border: InputBorder.none)),
//                               ),
//                               Container(height: 10)
//                             ],