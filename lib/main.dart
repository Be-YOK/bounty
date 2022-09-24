import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bounty',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Bounty'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(15, 25, 15, 50),
                child: Image(
                  image: AssetImage('assets/bounty_logo.png'),
                  width: 130,
                ),
              ),
              Container(
                height: 10,
              ),
              SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton(onPressed: () {}, child: Text('Sign in')),
              ),
              Container(
                height: 10,
              ),
              SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton(onPressed: () {}, child: Text('Sign up')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
