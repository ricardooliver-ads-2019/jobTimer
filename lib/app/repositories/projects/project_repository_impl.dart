import 'dart:developer';

import 'package:isar/isar.dart';
import 'package:job_timer/app/core/ui/database/database.dart';
import 'package:job_timer/app/core/ui/exeptions/failure.dart';
import 'package:job_timer/app/entities/project.dart';
import 'package:job_timer/app/entities/project_status.dart';

import './project_repository.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final Database _database;

  ProjectRepositoryImpl({required Database database}): _database = database;

  @override
  Future<void> register(Project project) async{
    try {
      final connection = await _database.openConnection();
      await connection.writeTxn((isar) {
        return isar.projects.put(project);
      });
    } on IsarError catch (e, s) {
      print('--------------------------------------------------------');
      print(e.message);
      print('--------------------------------------------------------');
      log('Erro ao cadastrar projeto', error: e.message, stackTrace: s);
      throw Failure(message: 'Erro: ${e.message}');
    }
  }

  @override
  Future<List<Project>> findByStatus(ProjectStatus status) async{
    final connection = await _database.openConnection();

    final project = await connection.projects.filter().statusEqualTo(status).findAll();

    return project;
  }

}
