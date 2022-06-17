part of 'home_cubit_controller.dart';

enum HomeStatus { initial, loading, success, error }

class HomeState extends Equatable {
  final HomeStatus status;
  final List<ProjectViewModel> project;
  final ProjectStatus projectFilter;

  HomeState._({
    required this.status,
    required this.project,
    required this.projectFilter,
  });

  HomeState.initial()
      : this._(
          status: HomeStatus.initial,
          project: [],
          projectFilter: ProjectStatus.em_andamento,
        );

  @override
  List<Object?> get props => [status, project, projectFilter];

  HomeState copyWith({
    HomeStatus? status,
    List<ProjectViewModel>? project,
    ProjectStatus? projectFilter,
  }) {
    return HomeState._(
      status: status ?? this.status,
      project: project ?? this.project,
      projectFilter: projectFilter ?? this.projectFilter,
    );
  }
}
