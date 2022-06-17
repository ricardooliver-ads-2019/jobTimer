
import '../entities/project_task.dart';

class ProjectTaskViewModel {
  final int? id;
  final String name;
  final int duration;
  
  ProjectTaskViewModel({
    this.id,
    required this.name,
    required this.duration,
  });

  factory ProjectTaskViewModel.fromEntity(ProjectTask task){
    return ProjectTaskViewModel(
      id: task.id,
      name: task.name,
      duration: task.duration,
    );
  }
}
