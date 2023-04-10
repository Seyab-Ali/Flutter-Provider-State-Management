import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_provider_state_management/provider/count_provider.dart';
import 'package:provider/provider.dart';

class CountScreen extends StatefulWidget {
  const CountScreen({Key? key}) : super(key: key);

  @override
  State<CountScreen> createState() => _CountScreenState();
}

class _CountScreenState extends State<CountScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    Timer.periodic(Duration(milliseconds: 3), (timer) {
      countProvider.setCount();

    });
  }

  @override
  Widget build(BuildContext context) {
    print("This is CountProvider");
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Count Example'),
      ),
      body: Center(
        child: Consumer<CountProvider>(builder: (context, value, child) {
          return Text(
            countProvider.count.toString(),
            style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          );

        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.setCount();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
