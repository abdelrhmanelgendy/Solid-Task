import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/presentation/solid_app.dart';
import 'core/utils/bloc_observer.dart';


void main() {
  Bloc.observer = AppBlocObserver();
  runApp(SolidApp());
}
