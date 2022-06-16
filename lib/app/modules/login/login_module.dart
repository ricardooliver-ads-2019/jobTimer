import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/modules/login/controller/login_controller_cubit.dart';
import 'package:job_timer/app/modules/login/login_page.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

class LoginModule extends Module{
  @override
  List<Bind> get binds => [
    BlocBind.lazySingleton((i) => loginControllerCubit(authService: i())) // AuthService -> AppModule
  ];
  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: ((context, args) =>  LoginPage(controllerCubit: Modular.get(),)))
  ];
}