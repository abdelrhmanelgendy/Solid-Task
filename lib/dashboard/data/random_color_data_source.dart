import 'dart:math';

import 'package:flutter/material.dart';

abstract class RandomColorDataSource {
  Color generateRandomColor();
}

class RandomColorDataSourceImpl extends RandomColorDataSource {
  @override
  Color generateRandomColor() => Color(Random().nextInt(0xffffffff));
}
