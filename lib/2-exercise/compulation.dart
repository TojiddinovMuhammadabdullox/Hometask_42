import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class ComputationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Heavy Computation')),
      body: FutureBuilder<int>(
        future: compute(heavyComputation, null),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Center(child: Text('Result: ${snapshot.data}'));
          }
        },
      ),
    );
  }

  static int heavyComputation(_) {
    int sum = 0;
    for (int i = 0; i < 1000000000; i++) {
      sum += i;
    }
    return sum;
  }
}
