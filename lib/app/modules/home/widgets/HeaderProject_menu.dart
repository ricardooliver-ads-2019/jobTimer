import 'package:flutter/material.dart';
import 'package:job_timer/app/entities/project_status.dart';

class HeaderprojectMenu extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        return Container(
          padding: const EdgeInsets.all(10),
          color: Colors.white,
          height: constraints.maxHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: constraints.maxWidth * .5,
                constraints: BoxConstraints(maxWidth: 250),
                child: DropdownButtonFormField<ProjectStatus>(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)
                    ),
                    contentPadding: const EdgeInsets.all(10),
                    isCollapsed: true),

                  items: ProjectStatus.values
                      .map(
                        (e) => DropdownMenuItem(
                          value: e, 
                          child: Text(e.label),
                        )
                      ).toList(), 
                  onChanged: (value){}
                ),
              ),
              Container(
                width: constraints.maxWidth * .4,
                constraints: BoxConstraints(maxWidth: 250),
                child: ElevatedButton.icon(
                  onPressed: (){}, 
                  icon: const Icon(Icons.add), 
                  label: const Text('Novo Projeto'),
                )
              ),
            ],
          ),
        );
      }),
    );
  }

  @override
  double get maxExtent => 80.0;

  @override
  double get minExtent => 80.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
  
}