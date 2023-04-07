
import 'dart:math';
 import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key? key,required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<DashboardScreen> {
  Color _backgroundColor = Colors.white;

  void _changeBackgroundColor() {
    setState(() {
      _backgroundColor = Color(Random().nextInt(0xffffffff));
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _changeBackgroundColor(),
      child: Scaffold(
        backgroundColor: _backgroundColor,
        body: Center(
          child: Text(
            widget.title,
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}

