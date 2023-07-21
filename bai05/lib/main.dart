import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(PrimeNumberCheckerApp());
}

class PrimeNumberCheckerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Prime Number Checker'),
        ),
        body: PrimeNumberChecker(),
      ),
    );
  }
}

class PrimeNumberChecker extends StatefulWidget {
  @override
  _PrimeNumberCheckerState createState() => _PrimeNumberCheckerState();
}

class _PrimeNumberCheckerState extends State<PrimeNumberChecker> {
  int number = 0;
  bool isPrime = false;

  bool checkPrime(int n) {
    if (n <= 1) return false;
    if (n == 2) return true;
    if (n % 2 == 0) return false;

    int sqrtN = sqrt(n).toInt();
    for (int i = 3; i <= sqrtN; i += 2) {
      if (n % i == 0) return false;
    }
    return true;
  }

  void onCheckButtonPressed() {
    setState(() {
      isPrime = checkPrime(number);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            keyboardType: TextInputType.number,
            onChanged: (value) {
              number = int.tryParse(value)!;
            },
            decoration: InputDecoration(
              labelText: 'Enter a number',
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: onCheckButtonPressed,
            child: Text('Check'),
          ),
          SizedBox(height: 20),
          Text(
            isPrime ? 'Day la so nguyen to.' : 'Day khong phai la so nguyen to.',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
