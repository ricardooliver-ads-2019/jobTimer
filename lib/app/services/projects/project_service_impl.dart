import 'package:job_timer/app/entities/project.dart';
import 'package:job_timer/app/repositories/projects/project_repository.dart';
import 'package:job_timer/app/view_model/project_view_model.dart';

import './project_service.dart';

class ProjectServiceImpl implements ProjectService {
  final ProjectRepository _projectRepository;

  ProjectServiceImpl({
    required ProjectRepository projectRepository,
  }) : _projectRepository = projectRepository;


  @override
  Future<void> register(ProjectViewModel projectViewModel) async{
    final project = Project()
    //project.id = projectViewModel.id;
    ..id = projectViewModel.id
    ..name = projectViewModel.name
    ..status = projectViewModel.status
    ..estimate = projectViewModel.estimate;
    
    await _projectRepository.register(project);
    
  }

}
