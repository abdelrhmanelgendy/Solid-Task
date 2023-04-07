import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:solid_task/dashboard/presenation/cubit/dashboard_cubit.dart';
import 'package:solid_task/dashboard/presenation/cubit/dashboard_state.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key, required this.title}) : super(key: key);

  final String title;
  late DashboardCubit dashboardCubit;
  Timer? timer;

  @override
  Widget build(BuildContext context) {
    dashboardCubit = BlocProvider.of(context);
    if (!dashboardCubit.isSwitchToggle) {
      timer?.cancel();
    }
    return BlocConsumer<DashboardCubit, DashboardStates>(
      builder: (context, state) => _buildBody(),
      listener: (context, state) {},
    );
  }

  Widget _buildBody() => GestureDetector(
        onTap: () => dashboardCubit.generateRandomColor(),
        child: Scaffold(
          backgroundColor: dashboardCubit.backgroundColor,
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildHelloText(),
                const SizedBox(
                  height: 200,
                ),
                _buildPeriodicColorWidget()
              ],
            ),
          ),
        ),
      );

  Widget _buildHelloText() => Text(
        title,
        style: TextStyle(fontSize: 30, color: getTextColor()),
      );

  Widget _buildPeriodicColorWidget() => Row(
    mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Automatic Color",
            style: TextStyle(fontSize: 20, color: getTextColor()),
          ),
          SizedBox(width: 15,),
          FlutterSwitch(
            height: 30.0,
            width: 65.0,
            padding: 4.0,
            toggleSize: 20.0,
            borderRadius: 10.0,
            activeColor: Colors.blue,
            value: dashboardCubit.isSwitchToggle,
            onToggle: (value) {
              dashboardCubit.changeSwitchState();
              if (value) {
                timer = Timer.periodic(const Duration(milliseconds: 500),
                    (Timer t) => dashboardCubit.generateRandomColor());
              } else {
                timer?.cancel();
              }
            },
          ),
        ],
      );

  Color getTextColor() =>
      dashboardCubit.isColorDark(dashboardCubit.backgroundColor)
          ? Colors.white
          : Colors.black;
}
