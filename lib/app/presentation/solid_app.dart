import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../dashboard/presenation/cubit/dashboard_cubit.dart';
import '../../dashboard/presenation/screens/dashboard_screen.dart';
import '../di/injection_container.dart';

class SolidApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) =>  sl<DashboardCubit>()),
      ],
      child:MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Solid Task',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: DashboardScreen(title: 'Hello There'),
      )
    );

   }
}
