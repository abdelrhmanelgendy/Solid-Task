import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/di/app_module.dart' as di;
import 'app/presentation/solid_app.dart';
import 'core/utils/bloc_observer.dart';


void main() async{
  Bloc.observer = AppBlocObserver();
  await di.initAppComponents();
  runApp(SolidApp());
}
