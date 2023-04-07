import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../data/random_color_data_source.dart';

abstract class ColorRepository {


  Either<Exception, Color> generateRandomColor();
}

class ColorRepositoryImpl implements ColorRepository {

  final RandomColorDataSource randomColorDataSource;

  ColorRepositoryImpl(this.randomColorDataSource);

  @override
  Either<Exception, Color> generateRandomColor() {

    try{

      return Right(randomColorDataSource.generateRandomColor());
    }catch(e)
    {
return Left(Exception(e.toString()));
    }
  }


}