

import 'package:get_it/get_it.dart';
import 'package:solid_task/dashboard/domain/use_case/generate_random_color_use_case.dart';
import 'package:solid_task/dashboard/presenation/cubit/dashboard_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
   sl.registerFactory<DashboardCubit>(() => DashboardCubit(randomColorUseCase: sl()));
   sl.registerFactory<GenerateRandomColorUseCase>(() => GenerateRandomColorUseCase());

 }
