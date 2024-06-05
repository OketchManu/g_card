import 'dart:async';
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
  home: GCard(),
));

class GCard extends StatefulWidget {
  const GCard({super.key});

  @override
  GCardState createState() => GCardState();
}

class GCardState extends State<GCard> {

  int gLevel = 0;
  Timer _timer= Timer(const Duration(seconds: 1), () {
    // Your timer logic here
  });

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(hours: 24), (Timer t) => setState(() {
      gLevel += 1;
    }));
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('OG Card'),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              setState(() {
                gLevel = 0;
              });
            },
            backgroundColor: Colors.red[800],
            child: const Icon(Icons.restart_alt),
          ),
          const SizedBox(height: 10.0),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                gLevel += 1;
              });
            },
            backgroundColor: Colors.grey[800],
            child: const Icon(Icons.add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Center(
              child: CircleAvatar(
                radius: 40.0,
                backgroundImage: AssetImage('assets/thumb.jpg'),
              ),
            ),
            Divider(
              color: Colors.grey[800],
              height: 60.0,
            ),
            const Text(
              'NAME',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              'TechSavi',
              style: TextStyle(
                color: Colors.amberAccent[200],
                fontWeight: FontWeight.bold,
                fontSize: 28.0,
                letterSpacing: 2.0,
              ),
            ),
            const SizedBox(height: 30.0),
            const Text(
              'HOMETOWN',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              'Kisumu, Kenya',
              style: TextStyle(
                color: Colors.amberAccent[200],
                fontWeight: FontWeight.bold,
                fontSize: 28.0,
                letterSpacing: 2.0,
              ),
            ),
            const SizedBox(height: 30.0),
            const Text(
              'CURRENT G LEVEL',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              '$gLevel',
              style: TextStyle(
                color: Colors.amberAccent[200],
                fontWeight: FontWeight.bold,
                fontSize: 28.0,
                letterSpacing: 2.0,
              ),
            ),
            const SizedBox(height: 30.0),
            Row(
              children: <Widget>[
                Icon(
                  Icons.email,
                  color: Colors.grey[400],
                ),
                const SizedBox(width: 10.0),
                Text(
                  'techsavi@theanonymous.co.ke',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 18.0,
                    letterSpacing: 1.0,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
