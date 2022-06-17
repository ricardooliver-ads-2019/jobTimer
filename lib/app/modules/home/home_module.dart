// ignore_for_file: prefer_const_constructors

import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/modules/home/cubit_controller/home_cubit_controller.dart';
import 'package:job_timer/app/modules/home/home_page.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

class HomeModule extends Module{
  @override
  List<Bind> get binds => [
    BlocBind.lazySingleton((i) => HomeCubitController(projectService: i())) // busca uma instacia de projectService no AppModule
  ];
  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: ((context, args) => HomePage(controller: Modular.get<HomeCubitController>()..loadProjects())))
  ];
}