import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/di/injection_container.dart' as di;
import 'app/presentation/solid_app.dart';
import 'core/utils/bloc_observer.dart';


void main() async{
  Bloc.observer = AppBlocObserver();
  await di.initAppComponents();
  runApp(SolidApp());
}
