import 'package:flutter/material.dart';

import '../../dashboard/presenation/screens/dashboard_screen.dart';

class SolidApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Solid Task',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DashboardScreen(title: 'Hello There'),
    );
  }
}
