import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_task/dashboard/presenation/cubit/dashboard_cubit.dart';
import 'package:solid_task/dashboard/presenation/cubit/dashboard_state.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key, required this.title}) : super(key: key);

  final String title;
  late DashboardCubit dashboardCubit;

  @override
  Widget build(BuildContext context) {
    dashboardCubit = BlocProvider.of(context);
    return BlocConsumer<DashboardCubit, DashboardStates>(
        builder: (context, state) => GestureDetector(
              onTap: () => dashboardCubit.generateRandomColor(),
              child: Scaffold(
                backgroundColor: dashboardCubit.backgroundColor,
                body: Center(
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
            ),
        listener: (context, state) {});
  }
}
