// ignore_for_file: camel_case_types

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:job_timer/app/services/auth/auth_service/auth_service.dart';
part 'login_state.dart';

class loginControllerCubit extends Cubit<LoginState>{
  final AuthService _authService;

  loginControllerCubit({required AuthService authService}) 
    : _authService = authService, 
      super(const LoginState.initial());

  Future<void> signIn() async{   
    try {
      emit(state.copyWith(status: LoginStatus.loading));
      //print(state.status);
      await _authService.signIn();
    } catch (e, s) {
      log('Erro ao realizar login', error: e, stackTrace: s);
      emit(state.copyWith(
        status: LoginStatus.erro, errorMessage: 'Erro ao realizar Login'
      ));
    }
  }
}