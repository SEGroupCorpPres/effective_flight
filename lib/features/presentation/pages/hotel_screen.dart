import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HotelScreen extends StatefulWidget {
  const HotelScreen({super.key});

  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Center(child: Text('Hotels'),),);

  }
}
