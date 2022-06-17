import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_timer/app/modules/home/cubit_controller/home_cubit_controller.dart';
import 'package:job_timer/app/modules/home/widgets/HeaderProject_menu.dart';
import 'package:job_timer/app/view_model/project_view_model.dart';

class HomePage extends StatefulWidget {
  final HomeCubitController controller;
  const HomePage({Key? key, required this.controller}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    widget.controller.loadProjects();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubitController, HomeState>(
      bloc: widget.controller,
      listener: (context, state) {
        if(state.status == HomeStatus.error){
          AsukaSnackbar.alert('Erro ao Carregar os Projetos').show();
        }
      },
      child: Scaffold(
          drawer: const Drawer(
            child: SafeArea(
                child: ListTile(
              title: Text('Sair'),
            )),
          ),
          body: SafeArea(
            child: CustomScrollView(
              slivers: [
                const SliverAppBar(
                  title: Text('Projetos'),
                  expandedHeight: 80,
                  toolbarHeight: 80,
                  centerTitle: true,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(20)),
                  ),
                ),
                SliverPersistentHeader(
                  delegate: HeaderprojectMenu(),
                  pinned: true,
                ),
                BlocSelector<HomeCubitController, HomeState, bool>(
                    bloc: widget.controller,
                    selector: (state) => state.status == HomeStatus.loading,
                    builder: (context, showLoading) {
                      return SliverVisibility(
                        visible: showLoading,
                        sliver: const SliverToBoxAdapter(
                          child: SizedBox(
                            height: 50,
                            child: Center(
                              child: CircularProgressIndicator.adaptive(),
                            ),
                          ),
                        ),
                      );
                    }),
                BlocSelector<HomeCubitController, HomeState,
                    List<ProjectViewModel>>(
                  bloc: widget.controller,
                  selector: (state) => state.project,
                  builder: (context, project) {
                    return SliverList(
                        delegate: SliverChildListDelegate(project
                            .map(
                              (proj) => ListTile(
                                title: Text(proj.name),
                                subtitle: Text('${proj.estimate}'),
                              ),
                            )
                            .toList()));
                  },
                ),
              ],
            ),
          )),
    );
  }
}
