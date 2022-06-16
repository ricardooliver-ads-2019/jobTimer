// ignore_for_file: prefer_const_constructors

import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_timer/app/modules/login/controller/login_controller_cubit.dart';

class LoginPage extends StatelessWidget {
  final loginControllerCubit controllerCubit;
  const LoginPage({Key? key, required this.controllerCubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final screenSize = MediaQuery.of(context).size;
    return BlocConsumer<loginControllerCubit, LoginState>(
      bloc: controllerCubit,
      listenWhen:(previous, current) => previous.status != current.status,
      listener: (context, state) {
        if(state.status == LoginStatus.erro){
          final message = state.errorMessage ?? 'Erro ao realizar login';
          AsukaSnackbar.alert(message).show();
        }
      },
      builder: (context, state) {
        return Scaffold(
            body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xFF0092B9),
            Color(0xFF0167B2),
          ])),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo.png'),
                SizedBox(
                  height: screenSize.height * 0.05,
                ),
                Container(
                  width: screenSize.width * .8,
                  constraints: BoxConstraints(maxWidth: 270),
                  child: ElevatedButton(
                      onPressed: () {
                        controllerCubit.signIn();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey[200],
                      ),
                      child: Image.asset('assets/images/google.png')),
                ),
                BlocSelector<loginControllerCubit, LoginState, bool>(
                  bloc: controllerCubit,
                  selector: (state) {
                    return state.status == LoginStatus.loading;
                  },
                  builder: (context, show) {
                    print(show);
                    return Visibility(
                      visible: show,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: CircularProgressIndicator.adaptive(
                            backgroundColor: Colors.white),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ));
      },
    );
  }
}
