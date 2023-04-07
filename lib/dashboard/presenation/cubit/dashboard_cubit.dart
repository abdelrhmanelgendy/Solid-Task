import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_task/core/usecases/usecase.dart';
import 'package:solid_task/core/utils/shared_components.dart';
import 'package:solid_task/dashboard/domain/use_case/generate_random_color_use_case.dart';

import 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardStates> {


  DashboardCubit({required this.randomColorUseCase})
      : super(DashboardIdleState());


 final GenerateRandomColorUseCase randomColorUseCase;

  Color _backgroundColor = Colors.white;

  Color get backgroundColor => _backgroundColor;

  bool isSwitchToggle = false;

  void changeSwitchState() {
    isSwitchToggle = !isSwitchToggle;
    emit(DashboardGenerateColorState());
  }

  void generateRandomColor() {
    final randomColorCallBack = randomColorUseCase.call(NoParams());
    randomColorCallBack.fold((error) {
      showToast(text: error.toString());
    }, (color) {
      _backgroundColor = color;
      emit(DashboardGenerateColorState());
    });
  }

  bool isColorDark() {
    final double darkness = _backgroundColor.red * 0.299 +
        _backgroundColor.green * 0.587 +
        _backgroundColor.blue * 0.114;
    return darkness < 186;
  }
}
