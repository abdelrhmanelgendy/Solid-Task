import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:solid_task/core/usecases/usecase.dart';

class GenerateRandomColorUseCase implements UseCase<Color, NoParams> {
  @override
  Either<Exception, Color> call(NoParams params) {
    return Right(Color(Random().nextInt(0xffffffff)));
  }
}
