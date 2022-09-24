// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Bounty',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       Bounty: const MyBountyPage(title: 'Bounty'),
//     );
//   }
// }

// class MyBountyPage extends StatefulWidget {
//   const MyBountyPage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   State<MyBountyPage> createState() => _MyBountyPageState();
// }

// class _MyBountyPageState extends State<MyBountyPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const Padding(
//                 padding: EdgeInsets.fromLTRB(15, 25, 15, 50),
//                 child: Image(
//                   image: AssetImage('assets/bounty_logo.png'),
//                   width: 130,
//                 ),
//               ),
//               Container(
//                 height: 10,
//               ),
//               SizedBox(
//                 width: 300,
//                 height: 50,
//                 child: ElevatedButton(onPressed: () {}, child: Text('Sign in')),
//               ),
//               Container(
//                 height: 10,
//               ),
//               SizedBox(
//                 width: 300,
//                 height: 50,
//                 child: ElevatedButton(onPressed: () {}, child: Text('Sign up')),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:bounty/Pages/home.dart';
import 'package:bounty/Pages/goals.dart';
import 'package:bounty/Pages/prizes.dart';
import 'package:bounty/Pages/details.dart';

Future main() async {
  runApp(const First());
}

class First extends StatelessWidget {
  const First({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bounty',
      // ignore: prefer_const_constructors
      home: Bounty(),
    );
  }
}

class Bounty extends StatefulWidget {
  const Bounty({Key? key}) : super(key: key);

  @override
  State<Bounty> createState() => _BountyState();
}

class _BountyState extends State<Bounty> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: DefaultTabController(
            length: 4,
            child: NestedScrollView(
              headerSliverBuilder: (context, value) {
                return [
                  const SliverAppBar(
                    bottom: TabBar(tabs: [
                      Tab(text: 'Home', icon: Icon(Icons.home)),
                      Tab(text: 'Goals', icon: Icon(Icons.gps_fixed_outlined)),
                      Tab(text: 'Prizes', icon: Icon(Icons.card_giftcard)),
                      Tab(text: 'History', icon: Icon(Icons.history)),
                    ]),
                    toolbarHeight: 10,
                  )
                ];
              },
              body: const TabBarView(children: [
                home(),
                goals(),
                prizes(),
                details(),
              ]),
            )),
      );
}



// class MyBountyPage extends StatefulWidget {
//   const MyBountyPage({Key? key}) : super(key: key);

//   @override
//   State<MyBountyPage> createState() => _MyBountyPageState();
// }

// class _MyBountyPageState extends State<MyBountyPage> {
//   @override
//   Widget build(BuildContext context) {
//     return const NewBounty();
//   }
// }
