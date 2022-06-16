
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:job_timer/app/entities/project_status.dart';
import 'package:job_timer/app/modules/project/project_module.dart';
import 'package:job_timer/app/services/projects/project_service.dart';
import 'package:job_timer/app/view_model/project_view_model.dart';
part 'project_register_state.dart';
class ProjectRegisterCubitController extends Cubit<ProjectRegisterStatus>{
  ProjectService _projectService;

  ProjectRegisterCubitController({required ProjectService projectService})
     : _projectService =  projectService,
     super(ProjectRegisterStatus.initial);

  
  Future<void> register(String name, int estimate) async{
    try {
      emit(ProjectRegisterStatus.loading);
      final project = ProjectViewModel(
        name: name,
        estimate: estimate,
        status: ProjectStatus.em_andamento,
        tasks: [],
      );
      
      await _projectService.register(project);
      emit(ProjectRegisterStatus.success);
    } catch (e,s) {
      log('Erro ao salvar Projeto', error: e, stackTrace: s);
      emit(ProjectRegisterStatus.error);
    }
  }
  
}