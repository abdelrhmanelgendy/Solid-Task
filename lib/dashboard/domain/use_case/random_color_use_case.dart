import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:solid_task/core/usecases/usecase.dart';

import '../repositry/random_color_repositry.dart';

class RandomColorUseCase implements UseCase<Color, NoParams> {

  ColorRepository colorRepository ;

  RandomColorUseCase({required this.colorRepository});

  @override
  Either<Exception, Color> call(NoParams params) {
    return colorRepository.generateRandomColor();
  }
}
