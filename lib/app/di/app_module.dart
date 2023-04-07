

import 'package:get_it/get_it.dart';
import 'package:solid_task/dashboard/data/random_color_data_source.dart';
import 'package:solid_task/dashboard/domain/repositry/random_color_repositry.dart';
import 'package:solid_task/dashboard/domain/use_case/random_color_use_case.dart';
import 'package:solid_task/dashboard/presenation/cubit/dashboard_cubit.dart';

final sl = GetIt.instance;

Future<void> initAppComponents() async {
   sl.registerFactory<DashboardCubit>(() => DashboardCubit(randomColorUseCase: sl()));
   sl.registerFactory<RandomColorUseCase>(() => RandomColorUseCase(colorRepository: sl()));
   sl.registerFactory<ColorRepository>(() => ColorRepositoryImpl(sl()));
   sl.registerFactory<RandomColorDataSource>(() => RandomColorDataSourceImpl());


 }
