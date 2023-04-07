import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:solid_task/core/usecases/usecase.dart';

import '../repositry/random_color_repositry.dart';

class GenerateRandomColorUseCase implements UseCase<Color, NoParams> {

  RandomColorRepository randomColorRepository ;

  GenerateRandomColorUseCase({required this.randomColorRepository});

  @override
  Either<Exception, Color> call(NoParams params) {
    return randomColorRepository.generateRandomColor();
  }
}
