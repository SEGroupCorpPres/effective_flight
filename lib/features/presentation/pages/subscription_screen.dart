import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Center(child: Text('Subscription'),),);
  }
}
