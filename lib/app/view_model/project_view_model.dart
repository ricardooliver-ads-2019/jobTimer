
import 'package:job_timer/app/entities/project_status.dart';
import 'package:job_timer/app/view_model/project_task_view_model.dart';

class ProjectViewModel {
  final int? id;
  final String name;
  final int estimate;
  final ProjectStatus status;
  final List<ProjectTaskViewModel> tasks;
  
  ProjectViewModel({
    this.id,
    required this.name,
    required this.estimate,
    required this.status,
    required this.tasks,
  });
}
