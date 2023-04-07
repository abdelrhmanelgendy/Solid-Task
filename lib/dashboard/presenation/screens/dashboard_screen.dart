import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
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
        builder: (context, state) => buildBody(),
        listener: (context, state) {});
  }

  buildBody() => GestureDetector(
        onTap: () => dashboardCubit.generateRandomColor(),
        child: Scaffold(
          backgroundColor: dashboardCubit.backgroundColor,
          body: Center(
            child: Column(
              children: [buildHelloText(), buildPeriodicColorButton()],
            ),
          ),
        ),
      );

  buildHelloText() => Text(
        title,
        style: TextStyle(
            fontSize: 30,
            color: dashboardCubit.isColorDark(dashboardCubit.backgroundColor)
                ? Colors.white
                : Colors.black),
      );

  buildPeriodicColorButton() => FlutterSwitch(
        height: 30.0,
        width: 65.0,
        padding: 4.0,
        toggleSize: 20.0,
        borderRadius: 10.0,
        activeColor: Colors.blue,
        value: dashboardCubit.isSwitchToggle,
        onToggle: (value) {
          dashboardCubit.changeSwitchState();
        },
      );
}
