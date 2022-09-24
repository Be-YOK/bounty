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
