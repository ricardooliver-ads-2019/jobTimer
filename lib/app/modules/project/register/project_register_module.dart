import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/modules/project/register/cubit_controller/project_register_cubit_controller.dart';
import 'package:job_timer/app/modules/project/register/project_register_page.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

class ProjectRegisterModule extends Module {
  @override
  // TODO: implement binds
  List<Bind<Object>> get binds => [
        BlocBind.lazySingleton(
          (i) => ProjectRegisterCubitController(projectService: i())), // a instancia de ProjectService vai ser pega dos binds do AppModule
      ];

  @override
  List<ModularRoute> get routes =>
      [ChildRoute('/', child: (context, args) => ProjectRegisterPage(controller: Modular.get()))];
}
