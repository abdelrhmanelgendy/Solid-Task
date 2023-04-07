import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_task/core/usecases/usecase.dart';
import 'package:solid_task/core/utils/shared_components.dart';
import 'package:solid_task/dashboard/domain/use_case/generate_random_color_use_case.dart';

import 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardStates> {
  DashboardCubit({required this.randomColorUseCase})
      : super(DashboardIdleState());
  GenerateRandomColorUseCase randomColorUseCase;

  Color _backgroundColor = Colors.white;
  Color get backgroundColor => _backgroundColor;

  void generateRandomColor() {
    var randomColorCallBack = randomColorUseCase.call(NoParams());
    randomColorCallBack.fold((error) {
      showToast(text: error.toString());
    }, (color) {
      _backgroundColor = color;
    });
  }
}
