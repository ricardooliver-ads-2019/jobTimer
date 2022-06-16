import 'package:flutter/material.dart';
import 'package:job_timer/app/modules/home/widgets/HeaderProject_menu.dart';

class HomePage extends StatelessWidget {

  const HomePage({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {
    return Scaffold( 
      drawer: const Drawer(
        child: SafeArea(child: ListTile(
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
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20)
                ),
              ),
            ),
            SliverPersistentHeader(
              delegate: HeaderprojectMenu(),
              pinned: true,
            ),
            SliverList(delegate: SliverChildListDelegate(
              [
                Container(
                  color: Colors.yellow,
                  width: 50,
                  height: 50,
                  child: const Text('test'),
                ),
                Container(
                  color: Colors.yellow,
                  width: 50,
                  height: 50,
                  child: const Text('test'),
                ),
                Container(
                  color: Colors.yellow,
                  width: 50,
                  height: 50,
                  child: const Text('test'),
                ),Container(
                  color: Colors.yellow,
                  width: 50,
                  height: 50,
                  child: const Text('test'),
                ),
                Container(
                  color: Colors.yellow,
                  width: 50,
                  height: 50,
                  child: const Text('test'),
                ),
                Container(
                  color: Colors.yellow,
                  width: 50,
                  height: 50,
                  child: const Text('test'),
                ),
                Container(
                  color: Colors.yellow,
                  width: 50,
                  height: 50,
                  child: const Text('test'),
                ),
                Container(
                  color: Colors.yellow,
                  width: 50,
                  height: 50,
                  child: const Text('test'),
                ),
                Container(
                  color: Colors.yellow,
                  width: 50,
                  height: 50,
                  child: const Text('test'),
                ),
                Container(
                  color: Colors.yellow,
                  width: 50,
                  height: 50,
                  child: const Text('test'),
                ),
                Container(
                  color: Colors.yellow,
                  width: 50,
                  height: 50,
                  child: const Text('test'),
                ),
                Container(
                  color: Colors.yellow,
                  width: 50,
                  height: 50,
                  child: const Text('test'),
                ),Container(
                  color: Colors.yellow,
                  width: 50,
                  height: 50,
                  child: const Text('test'),
                ),
                Container(
                  color: Colors.yellow,
                  width: 50,
                  height: 50,
                  child: const Text('test'),
                ),
                Container(
                  color: Colors.yellow,
                  width: 50,
                  height: 50,
                  child: const Text('test'),
                ),
                Container(
                  color: Colors.yellow,
                  width: 50,
                  height: 50,
                  child: const Text('test'),
                ),
                Container(
                  color: Colors.yellow,
                  width: 50,
                  height: 50,
                  child: const Text('test'),
                ),
                Container(
                  color: Colors.yellow,
                  width: 50,
                  height: 50,
                  child: const Text('test'),
                ),
              ]
            )),
          ],
        ),
      )
    );
  }
}