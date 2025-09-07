import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreativeCounterPage extends StatefulWidget {
  const CreativeCounterPage({super.key});

  @override
  State<CreativeCounterPage> createState() => _CreativeCounterPageState();
}

class _CreativeCounterPageState extends State<CreativeCounterPage> {
  int _counter = 0;
  Color _backgroundColor = Colors.white;
  String _emoji = '😐';
  final Random _random = Random();

  void _incrementCounter() {
    setState(() {
      _counter++;

      _backgroundColor = Color.fromARGB(
        _random.nextInt(256),
        _random.nextInt(256),
        _random.nextInt(256),
        _random.nextInt(256),
      );
      if (_counter >= 20) {
        _emoji = '🤩';
      } else if (_counter >= 10) {
        _emoji = '😄';
      } else if (_counter >= 5) {
        _emoji = '🙂';
      } else {
        _emoji = '😐';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        foregroundColor: Colors.white,
        title: const Text('Creative Counter ✨'),
      ),
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        color: _backgroundColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                _emoji,
                style: const TextStyle(fontSize: 80),
              ),
              const SizedBox(height: 20),
              const Text(
                'You have pushed the button this many times:',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.black87),
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 60,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}