import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BrieflySpeakingScreen extends StatefulWidget {
  const BrieflySpeakingScreen({super.key});

  @override
  State<BrieflySpeakingScreen> createState() => _BrieflySpeakingScreenState();
}

class _BrieflySpeakingScreenState extends State<BrieflySpeakingScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Center(child: Text('Briefly Speaking'),),);

  }
}
